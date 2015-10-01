class UsersController < ApplicationController

    before_action :require_login, only: [:edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :city, :avatar)
    @user = User.new(user_params)
    @user.full_name = @user.first_name + ' ' + @user.last_name
    if @user.save
      #login user
      session[:user_id] = @user.id
      #redirect to user#show w/ success message
      redirect_to @user, flash: { success: "Successfully signed up!" }
    else
      #there was an error, go back to signup page & display message
      redirect_to sign_up_path, flash: { error: @user.errors.full_messages.to_sentence }
    end
  end

  def edit
    @user = User.friendly.find(params[:id])
    if @user.id == current_user.id
        render :edit
    else
        redirect_to root_path
    end
  end

  def update
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :city)
    @user = User.friendly.find(params[:id])
    a = params[:user]
    a[:full_name] = a[:first_name] + " " + a[:last_name]
      if @user.update(user_params)
         redirect_to user_path(@user)
      else
        render :edit
      end
  end

  def show
    @user = User.friendly.find(params[:id])
  
    render :show
  end



end
