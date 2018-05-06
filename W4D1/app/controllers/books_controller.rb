class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    end

  end

  def destroy
    target_book = Book.find_by(id: params[:id])
    target_book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
