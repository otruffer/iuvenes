class UsersController < ApplicationController
  before_filter :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    if (current_user.root)
      @users = User.all
      @unapproved_users = User.where(:approved => false)
    elsif (current_user.admin)
      @users = User.where(:verbindung_id => current_user.verbindung_id)
      @unapproved_users = User.where(:verbindung_id => current_user.verbindung_id, :approved => false)
    else
      redirect_to root_path
      return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if !access_to_user(@user) then return end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user.to_json }
    end
  end

  #GET /users/new
  #GET /users/new.json
  def new
    if !check_root then return end
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    access_to_user(@user)
  end

  # POST /users
  # POST /users.json
  def create
    if !check_root then return end
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    unless access_to_user(@user) then
      return
    end

    #if the current user is not authorized to change the admin status, the admin status stays the same.
    unless current_user.root? || current_user.admin? then
      params[:user][:admin] = @user.admin
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Benutzer wurde erfolgreich gespeichert.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def add_push_notification
    @user = User.find(params[:id])
    unless access_to_user(@user) then return false end
    @push_notification = PushNotification.new(params[:push_notification])
    @push_notification.user_id = @user.id
    respond_to do |format|
      if @push_notification.save
        format.json { render json: @push_notification, status: :created}
      else
        format.json { render json: @push_notification.errors, status: :unprocessable_entity }
      end
    end

  end

  def access_to_user(the_user)
    if !(current_user.root? || (current_user.admin? && current_user.verbindung == the_user.verbindung) || current_user == the_user)
      redirect_to root_path
      return false
    end
    return true
  end

  def approve
    @user = User.find(params[:id])
    if !(current_user.root? ||(current_user.admin? && current_user.verbindung == @user.verbindung))
      redirect_to root_path
      return
    end

    @user.approved = true
    @user.save
    respond_to do |format|
      format.html {
        redirect_to users_path, :notice => 'Benutzer wurde freigeschaltet.'
      }
      format.json {head :no_content}
    end
  end

  def check_root
    if !current_user.root?
      redirect_to root_path
      return false
    end
    return true
  end
end
