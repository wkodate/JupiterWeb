class RssesController < ApplicationController
  before_action :set_meta_tag

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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_meta_tag
      set_meta_tags noindex: true
      set_meta_tags nofollow: true
    end

end
