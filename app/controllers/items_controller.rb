class ItemsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :admin_user, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.eager_load(:rss).paginate(page: params[:page], :per_page => 20).order("date DESC")
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @rss = Rss.find(@item.rss_id)
    set_meta_tags twitter: {
      card: "summary",
      title: @item.title,
      decription: @item.description,
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

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(login_url) unless current_user.admin?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:link, :title, :description, :date, :image, :rss_id)
    end

end
