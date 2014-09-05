class PagesController < ApplicationController
  layout "articles"
  def show
    @article = Article.page.friendly.find(params[:page])
  end

end
