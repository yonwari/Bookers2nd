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
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # エラーで分岐
    if @book.save
      flash[:notice] = "book was created successfully!"
      redirect_to books_path
    else
      render "books/index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    # エラーで分岐
    if @book.update(book_params)
      flash[:notice] = "book was updated successfully!"
      redirect_to book_path(@book)
    else
      render "books/edit"
    end
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
