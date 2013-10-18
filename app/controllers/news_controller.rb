class NewsController < ApplicationController
  before_filter :authenticate_user!

  # GET /news
  # GET /news.json
  def index
    @verbindung = Verbindung.find(params[:verbindung_id])
    @news = News.where(:verbindung_id => @verbindung)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @verbindung = Verbindung.find(params[:verbindung_id])
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/new
  # GET /news/new.json
  def new
    @verbindung = Verbindung.find(params[:verbindung_id])
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1/edit
  def edit
    @verbindung = Verbindung.find(params[:verbindung_id])
    @news = News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  def create
    @verbindung = Verbindung.find(params[:verbindung_id])
    @news = News.new(params[:news])
    @news.verbindung_id = current_user.verbindung_id
    @news.date = Date.new
    respond_to do |format|
      if @news.save
        format.html { redirect_to verbindung_news_index_path(@verbindung), notice: 'News was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to verbindung_news_index_path, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to verbindung_news_index_path }
      format.json { head :no_content }
    end
  end
end
