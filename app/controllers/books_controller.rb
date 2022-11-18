class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    @user =current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if (@book.user.id != current_user.id)
      redirect_to books_path
    end
  end

  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
    if @book.save
      flash[:successfully] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user =current_user
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:successfully] =   "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
