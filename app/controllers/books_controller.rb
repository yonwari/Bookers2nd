class BooksController < ApplicationController
  def top
  end

  def about
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = User.find(current_user.id)
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "book was created successfully!"
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update
    flash[:notice] = "book was updated successfully!"
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "book was deleted successfully!"
    redirect_to books_path
  end

  # 以下ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(
              :title,
              :body,)
  end

end
