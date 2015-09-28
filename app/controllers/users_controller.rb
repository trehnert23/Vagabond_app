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

  def show
    @user = User.find_by({id: params[:id]})
    render :show
  end


end
