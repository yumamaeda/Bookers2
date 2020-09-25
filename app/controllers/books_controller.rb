class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_book,only: [:edit]
  def index
    @books = Book.all.order("id DESC")
    @user = current_user
    @book = Book.new
    
  end

  def show
     @books = Book.find(params[:id])
     @book = Book.new
     @users = current_user
     @user = @books.user
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      # 問題
      redirect_to book_path(@book)
      else
      @books = Book.all
          @book.user = current_user
      flash[:notice] = "error"
      @user = current_user
      render "index"
    end
  end

  def edit
     @book = Book.find(params[:id])
  end

    def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book)
    flash[:notice] = "successfully"
  else
    flash[:notice] = "error"
    @book = Book.find(params[:id])
    render "edit"
  end
  end

    def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def baria_book
  @book = Book.find(params[:id])
  @user = @book.user
    if current_user != @user
      redirect_to books_path
    end
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
