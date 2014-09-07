class PagesController < ApplicationController
  def show
    @article = Article.page.friendly.find(params[:page])
  end

end
