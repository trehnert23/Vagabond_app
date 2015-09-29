class ArticlesController < ApplicationController
  

  def new
  	@articles = Article.all
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    article_params = params.require(:article).permit(:title, :content, :city)
    @article = current_user.articles.create(article_params)
    redirect_to "/articles/#{@article.id}"
    # "/users/#{@article.user_id}"
  end

  def show
    @article = Article.find_by({id: params[:id]})
    @author = User.find(@article.user_id).first_name
    render :show
  end

end
