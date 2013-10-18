class RouteController < ApplicationController
  before_filter :authenticate_user!

  # GET /events
  # GET /events.json
  def anlaesse
    @id = current_user.verbindung_id

    respond_to do |format|
      format.html { redirect_to verbindung_events_path(@id) }
      format.json { redirect_to verbindung_events_path(@id, format: :json) }
    end
  end

  # GET /news
  # GET /news.json
  def news
    @id = current_user.verbindung_id

    respond_to do |format|
      format.html { redirect_to verbindung_news_index_path(@id) }
      format.json { redirect_to verbindung_news_index_path(@id, format: :json) }
    end
  end

  # GET /profile
  # GET /profile.json
  def profile
    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
      format.json { redirect_to user_path(current_user.id, format: :json) }
    end
  end
end