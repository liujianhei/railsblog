class Admin::ArticlesController < ApplicationController
 
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def new
    @article = Article.new(title: "无标题文本")
    @article.save
    #redirect_to :action => :edit, :id => @article
    redirect_to edit_admin_article_path(@article)
  end

  def create
    tags = params[:article].delete(:tags).to_s
    @article = Article.new(article_params)

    tags.split(",").each do |name|
      tag = Tag.find_or_initialize_by(name: name.strip)
      tag.save!
      @article.tags << tag
      end
 
    if @article.save
      redirect_to @article
    else
      render 'new_admin'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all()
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    tags = params[:article].delete(:tags).to_s
    puts "----------------------"
    puts tags
    @article = Article.find(params[:id])
    puts "----------------------"
    @article.tags = []
    tags.split(",").each do |name|
      puts name
      tag = Tag.find_or_initialize_by(name: name.strip)
      puts tag.name
      tag.save!
      @article.tags << tag
      end
 
    puts "----------------------"
    if @article.update(article_params)
      redirect_to @article
    else
      render 'new_admin'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
   
  def autosave
    tags = params[:article].delete(:tags).to_s
    @article = Article.new(article_params)

    @article.tags = []
    tags.split(",").each do |name|
      tag = Tag.find_or_initialize_by(name: name.strip)
      tag.save!
      @article.tags << tag
      end

    @article.save

    render 'new'
  end

 
private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
