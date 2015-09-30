class UsersController < ApplicationController

    before_action :require_login, only: [:show, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :city)
    @user = User.new(user_params)
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
    @user = User.find(params[:id])
    if @user.id == current_user.id
        render :edit
    else
        redirect_to root_path
    end
  end

  def update
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :city)
    @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path(@user)
      else
        render :edit
      end
  end

  def show
    @user = User.find_by({id: params[:id]})
    render :show
  end


end
