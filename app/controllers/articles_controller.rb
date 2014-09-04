class ArticlesController < ApplicationController
 
  def show
    @article = Article.publish.friendly.find(params[:id])
  end

  def index
    @articles = Article.publish
  end

end
