class ArticlesController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy]
  def index
    @All_Articles = Article.all
  end

  def new
    @new = Article.new
  end

  def edit
    @edit = @article
    # redirect_to edit_article_path(@edit)
  end


  def create
    # render text: params[:article].inspect
    @new_article = Article.new(params_article)
    @new_article.user = User.first

    if @new_article.save
      flash[:success] = "Article was successfully created"  
      redirect_to article_path(@new_article)
    else
      # byebug
      @new = @new_article
      render 'new'
    end
  end

  def show
   @show = @article
    
  end

  def update
    # render text: params[:article].inspect

    @update = @article
    # byebug
    if @update.update(params_article)
      flash[:success] = "Article was successfully Updated"
      redirect_to article_path(@update)
    else
      @edit = @update
      render 'edit'
    end
  end

  def destroy
    @destory = @article
    id = @destory.id
    @destory.destroy
    flash[:danger] =  "Article #{id} was successfully Deleted"
    redirect_to articles_path

  end

  private

    def set_params
      @article = Article.find(params[:id])
    end
    def params_article
        params.require(:article).permit(:title, :description)
    end
end