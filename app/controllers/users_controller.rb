class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def index
    @users = User.find(current_user.id)

    @book = Book.new
  end

  def edit
  end
end
