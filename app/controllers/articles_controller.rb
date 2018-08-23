class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :requires_user, except: [:index, :show]
  before_action :requires_same_user, onyl: [:edit, :update, :destroy]
  
  def index
    # all articles: @articles = Article.all
    # using will_paginate:
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # example to render parms in page
    # render plain: params[:article].inspect
    #
    #debugger # then n
    #
    @article = Article.new(article_params)
    @article.user = User.last
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was sucessfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
 
  def show

  end

  def destroy
    @article.destroy
    flash[:danger] = "article was successfully deleted"
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end
