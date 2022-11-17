class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    @users =current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @users =current_user
    @books = Book.all
    @book = Book.new
  end

  def edit
  end

  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
    if @book.save
      flash[:successfully] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @users =current_user
      @books = Book.all
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
