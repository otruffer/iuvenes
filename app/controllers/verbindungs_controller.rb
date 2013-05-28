class VerbindungsController < ApplicationController

  before_filter :authenticate_user!, :only => [:edit, :update, :destroy, :create]
  before_filter :check_root, :only => [:destroy]

  # GET /verbindungs
  # GET /verbindungs.json
  def index
    @verbindungs = Verbindung.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @verbindungs }
    end
  end

  # GET /verbindungs/1
  # GET /verbindungs/1.json
  def show
    @verbindung = Verbindung.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @verbindung }
    end
  end

  # GET /verbindungs/new
  # GET /verbindungs/new.json
  def new
    @verbindung = Verbindung.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @verbindung }
    end
  end

  # GET /verbindungs/1/edit
  def edit
    @verbindung = Verbindung.find(params[:id])
    if !access_to_edit(@verbindung) then return end
  end

  # POST /verbindungs
  # POST /verbindungs.json
  def create
    @verbindung = Verbindung.new(params[:verbindung])

    respond_to do |format|
      if @verbindung.save
        format.html { redirect_to @verbindung, notice: 'Verbindung was successfully created.' }
        format.json { render json: @verbindung, status: :created, location: @verbindung }
      else
        format.html { render action: "new" }
        format.json { render json: @verbindung.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /verbindungs/1
  # PUT /verbindungs/1.json
  def update
    @verbindung = Verbindung.find(params[:id])
    if !access_to_edit(@verbindung) then
      redirect_to root_path
      return
    end

    respond_to do |format|
      if @verbindung.update_attributes(params[:verbindung])
        format.html { redirect_to verbindung_path(@verbindung), notice: 'Verbindung was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @verbindung.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verbindungs/1
  # DELETE /verbindungs/1.json
  def destroy
    @verbindung = Verbindung.find(params[:id])
    @verbindung.destroy

    respond_to do |format|
      format.html { redirect_to verbindungs_url }
      format.json { head :no_content }
    end
  end

  def check_root
    if !current_user.root?
      redirect_to root_path
    end
  end

  def access_to_edit(verbindung)
    if !(current_user.root? || (current_user.admin? && current_user.verbindung == verbindung))
      redirect_to root_path
      false
    end
    true
  end
end
