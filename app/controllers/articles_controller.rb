class ArticlesController < ApplicationController
 
  def show
    @article = Article.publish.where(id: params[:id]).first
  end

  def index
    @articles = Article.publish
  end

end
