class RssesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def index
    @rsses = Rss.paginate(page: params[:page])
  end

  def show
    @rss = Rss.find(params[:id])
  end

  def new
    @rss = Rss.new
  end

  def create
    @rss = Rss.new(rss_params)
    if @rss.save
      flash[:info] = "New rss registered"
      redirect_to rsses_url
    else
      render 'new'
    end
  end

  def edit
    @rss = Rss.find(params[:id])
  end

  def update
    @rss = Rss.find(params[:id])
    if @rss.update_attributes(rss_params)
      flash[:success] = "Rss profile updated"
      redirect_to @rss
    else
      render 'edit'
    end
  end

  def destroy
    Rss.find(params[:id]).destroy
    flash[:success] = "Rss deleted"
    redirect_to rsses_url
  end

  private

    def rss_params
      params.require(:rss).permit(:rss_url, :title, :site_link, :description)
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

end
