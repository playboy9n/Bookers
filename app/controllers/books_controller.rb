class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all.order(created_at: :desc)
    @book = Book.new
  end

  def top
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(books_params)
  	if book.save
  	redirect_to book_path(book.id), notice: 'Book was successfully created.'
  else
    render :index
  end
  end

  def edit
  	@book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(books_params)
    redirect_to book_path(book.id)
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def books_params
  		params.require(:book).permit(:title, :category, :body)
  	end
end

