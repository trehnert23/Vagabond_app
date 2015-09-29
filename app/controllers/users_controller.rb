class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :city)
    @user = User.create(user_params)
    login(@user)
    
    redirect_to "/users/#{@user.id}"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :city)
    @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user)
      else
        render :edit
      end


    # @user = User.find_by(params[:id])

    # redirect_to "/update"

  end

  def show
    @user = User.find_by({id: params[:id]})
    render :show
  end


end
