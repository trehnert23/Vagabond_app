class ArticlesController < ApplicationController

   before_action :require_login, only: [:edit]

  def index
  	@articles = Article.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 1)
  end

  def new
    @article = Article.new
    if current_user
      render :new
    else
      redirect_to new_user_path
    end
  end

  def create
    article_params = params.require(:article).permit(:title, :content, :city_id, :street, :state, :country)
    @article = current_user.articles.create(article_params)
    @user = current_user
    # redirect_to "/articles/#{@article.id}", flash: { success: "Thanks for the new destination tip!" }
    redirect_to user_path(current_user)
  end

  def show
    @article = Article.find_by({id: params[:id]})
    @author = User.find(@article.user_id).first_name
    @city = City.find(@article.city_id).name
    @comments = @article.comments
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
    redirect_to user_path(current_user), flash: { success: "Are you sure you want to keep this cool interstellar destination a secret?" }
  end


end
