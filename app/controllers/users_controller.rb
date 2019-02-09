class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.new
    @books = Book.where(user_id:params[:id])
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(user_params)
    @user.update
    flash[:notice] = "user was updated successfully!"
    redirect_to user_path
  end

  # 以下ストロングパラメータ
  private

  def user_params
    params.require(:user).permit(
              :name,
              :image,
              :introduction)
  end

end
