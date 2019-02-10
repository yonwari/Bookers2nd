class UsersController < ApplicationController
  
  def index
    @book = Book.new
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.new #新規作成用
    @books = Book.where(user_id:params[:id]) #book一覧表示用
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # エラーで分岐
    if @user.update(user_params)
      flash[:notice] = "user was updated successfully!"
      redirect_to user_path(@user.id)
    else
      render "users/edit"
    end
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
