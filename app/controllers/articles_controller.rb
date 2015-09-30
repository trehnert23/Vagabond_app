class ArticlesController < ApplicationController

   before_action :require_login, only: [:edit, :new]

  def index
  	@articles = Article.all
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    article_params = params.require(:article).permit(:title, :content, :city_id, :street, :state, :country)
    @article = current_user.articles.create(article_params)
    redirect_to "/articles/#{@article.id}", flash: { success: "Boom! New date added!" }
  end

  def show
    @article = Article.find_by({id: params[:id]})
    @author = User.find(@article.user_id).first_name
    @city = City.find(@article.city_id).name
    render :show
  end

  def edit
    @article = Article.find(params[:id])
    if @article.user_id == current_user.id
        render :edit
    else
        redirect_to root_path
    end
  end

  def update
    article_params = params.require(:article).permit(:title, :content, :city, :street, :state, :country)
    @article = Article.find(params[:id])
      if @article.update(article_params)
         redirect_to article_path(@article)
      else
        render :edit    ### potentially change render page???? ###
      end
  end

  def destroy
    Article.delete(params[:id])
    redirect_to user_path(current_user), flash: { success: "Date has been deleted!" }
  end


end
