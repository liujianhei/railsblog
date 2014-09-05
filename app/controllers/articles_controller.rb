class ArticlesController < ApplicationController
 
  def show
    @article = Article.article.publish.friendly.find(params[:id])
  end

  def index
    @articles = Article.article.publish
  end

end
