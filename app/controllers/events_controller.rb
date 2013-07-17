class EventsController < ApplicationController
  before_filter :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    @verbindung = Verbindung.find(params[:verbindung_id])
    @events = Event.where(:verbindung_id => @verbindung.id).where("date >= ?", Date.today).order("date")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @verbindung = Verbindung.find(params[:verbindung_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @verbindung = Verbindung.find(params[:verbindung_id])
    if !has_access_to_verbindung(@verbindung) then return end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @verbindung = Verbindung.find(params[:verbindung_id])
    if !has_access_to_verbindung(@verbindung) then return end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.verbindung_id = current_user.verbindung_id
    @verbindung = Verbindung.find(current_user.verbindung_id)
    if !has_access_to_verbindung(@verbindung) then return end

    respond_to do |format|
      if @event.save
        format.html { redirect_to verbindung_events_path(@event.verbindung_id), notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @verbindung = Verbindung.find(params[:verbindung_id])
    if !has_access_to_verbindung(@verbindung) then return end

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @verbindung = Verbindung.find(params[:verbindung_id])
    if !has_access_to_verbindung(@verbindung) then return end

    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to verbindung_events_url(@verbindung) }
      format.json { head :no_content }
    end
  end

  def join
    @event = Event.find(params[:id])
    if (!@event.users.include? current_user) then
      @event.users.push(current_user)
      @event.save
    end
    @verbindung = Verbindung.find(params[:verbindung_id])

    respond_to do |format|
      format.html { redirect_to verbindung_events_url(@verbindung) }
    end
  end

  def leave
    @event = Event.find(params[:id])
    @event.users.delete(current_user)
    @event.save
    @verbindung = Verbindung.find(params[:verbindung_id])

    respond_to do |format|
      format.html { redirect_to verbindung_events_url(@verbindung) }
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
end