class ItemsController < ApplicationController
  before_action :set_meta_tag
  before_action :logged_in_user, except: [:index]
  before_action :admin_user, except: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.eager_load(:rss).paginate(page: params[:page]).order("date DESC")
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @rss = Rss.find(@item.rss_id)
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

  def set_meta_tag
    set_meta_tags title: "なんJまとめのまとめ | プロ野球情報満載！なんでも実況まとめブログのアンテナサイト",
                  keywords: "なんJまとめのまとめ,なんJ,アンテナ,野球",
                  description: "なんでも実況(ジュピター)まとめブログのアンテナサイトです。プロ野球好きにはたまらない野球情報が盛りだくさん！数あるなんJまとめサイトを最新記事からまとめて閲覧することができます。野球,NPB,MLB,なんJ,おんJネタが好きな方にはおすすめ！",
                  icon: "/favicon.ico",
                  author: "https://twitter.com/hbwandeow",
                  canonical: "https://matome-nanj.net/"
  end

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
      params.require(:item).permit(:link, :title, :description, :date, :rss_id)
    end

end
