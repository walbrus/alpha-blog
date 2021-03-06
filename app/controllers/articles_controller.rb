class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all
  end
  
  
  def new 
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
    
      flash[:success] = "Article was created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    
  end
  
  def show
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:danger] = "Article was deleted"
  end
  
  def edit
  end
  
  def update
   
    if @article.update(article_params)
      flash[:sucess] = "Article Sucessfully Updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  
  
  
  

  
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
  def set_article
    @article = Article.find(params[:id])
  end
  
end
