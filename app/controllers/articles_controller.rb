class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: "shreyash", password: "secret", except: [:index, :show]
  def new
    @article=Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  def show
    @article = Article.find(params[:id])
  end

  def showtop10
    @articles = Article.order(id: :desc).limit(10)
  end


  def favorites
    @articles= Article.where(checkbox: true)
  end

  def allarticles
    @articles= Article.all
  end

  def index
    @articles =current_user.articles
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text,:checkbox)
    end
end
