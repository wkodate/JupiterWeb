class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.eager_load(:rss).paginate(page: params[:page], :per_page => 20).order("date DESC")
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
      description: @item.description,
      image: @item.image,
    }
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:info] = "New item registered"
      redirect_to @item
    else
      render 'new'
    end
  end

  # GET /items/1/edit
  def edit
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update_attributes(item_params)
      flash[:success] = "Item profile updated"
      redirect_to @item
    else
      render 'edit'
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to items_url
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:link, :title, :description, :date, :image, :rss_id)
    end

end
