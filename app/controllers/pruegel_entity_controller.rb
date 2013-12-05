class PruegelEntityController < ApplicationController
  TYPE = 'undef';
  before_filter :authenticate_user!
  attr_accessor :type

  # GET /events
  # GET /events.json
  def index
    @verbindung = Verbindung.find(params[:verbindung_id])
    @entities = PruegelEntity.where(:verbindung_id => @verbindung.id).where(:type => get_type).paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entities }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @entity = PruegelEntity.find(params[:id])
    @verbindung = Verbindung.find(params[:verbindung_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entity }
    end
  end

  def search
    @verbindung = Verbindung.find(params[:verbindung_id])
    @entities = PruegelEntity.where(:verbindung_id => @verbindung).paginate(:page => params[:page], :conditions =>
        ['title like ? OR content like ?', "%#{params[:search]}%", "%#{params[:search]}%"])
    @search = params[:search]

    respond_to do |format|
      format.html {render 'index'}
      format.json {render :json => @entities}
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @entity = get_new()
    @verbindung = Verbindung.find(params[:verbindung_id])
    if !has_access_to_verbindung(@verbindung) then return end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entity }
    end
  end

  def edit
    @entity = PruegelEntity.find(params[:id])
    @verbindung = Verbindung.find(params[:verbindung_id])
    if !has_access_to_verbindung(@verbindung) then return end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entity }
    end
  end

  # POST /events
  # POST /events.json
  def create
    @entity = get_new(params)
    @entity.type = get_type
    @entity.verbindung_id = current_user.verbindung_id
    @entity.creator = current_user.id
    @entity.last_edited_by = current_user.id
    @verbindung = Verbindung.find(current_user.verbindung_id)
    if !has_access_to_verbindung(@verbindung) then return end

    respond_to do |format|
      if @entity.save
        format.html { redirect_to :action => 'index', notice: 'Event was successfully created.' }
        format.json { render json: @entity, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @entity = PruegelEntity.find(params[:id])
    @verbindung = Verbindung.find(params[:verbindung_id])
    params[:last_edited_by] = current_user.id
    if !has_access_to_verbindung(@verbindung) then return end

    respond_to do |format|
      if @entity.update_attributes(parse_entry_params(params))
        format.html { redirect_to :action => 'index', notice: 'Speichern erfolgreich!' }
          format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @verbindung = Verbindung.find(params[:verbindung_id])
    if !has_access_to_verbindung(@verbindung) then return end

    @entity = PruegelEntity.find(params[:id])
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index', :notice => 'Eintrag wurde erfolgreich geloescht.' }
      format.json { head :no_content }
    end
  end

  def has_access_to_verbindung(verbindung)
    if(current_user.verbindung == verbindung && current_user.admin? || current_user.root?) then
      true
    else
      redirect_to root_path
      return false
    end
  end

  def get_type
    return TYPE
  end

  def get_new(params = false)
    if(params != false)
      return PruegelEntity.new(params[:pruegel_entity])
    else
      return PruegelEntity.new
    end
  end
end