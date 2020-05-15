class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
      @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to user_path(current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def update
    @user = User.find(params[:id])
    if 
      @user.update(user_params)
       flash[:notice] = "You have updated user successfully"
       redirect_to user_path(@user.id)
    else 
      render :edit
    end   
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
