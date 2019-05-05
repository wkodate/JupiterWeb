class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  # GET /items
  # GET /items.json
  def index
    @items = Item.eager_load(:rss).paginate(page: params[:page], :per_page => 10).order("date DESC")
  end

  # GET /items/1
  # GET /items/1.json
  def show
    set_meta_tags title: @item.title, reverse: true
    @rss = Rss.find(@item.rss_id)
    set_meta_tags twitter: {
      card: "photo",
      site: request.url,
      title: @item.title,
      image: @item.image,
    }
  end

  # GET /items/new
  def new
  end

  # POST /items
  # POST /items.json
  def create
  end

  # GET /items/1/edit
  def edit
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

end
