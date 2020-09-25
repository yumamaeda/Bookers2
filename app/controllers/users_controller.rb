class UsersController < ApplicationController
  before_action :authenticate_user!
    before_action :baria_book,only: [:edit]

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
    def edit
    @user = User.find(params[:id])
  end
def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
  else
     flash[:notice] = "error"
     render "edit"
   end
end

def index
    @user = current_user
    @books = @user.books
    @book = Book.new
    @users = User.all
end

private
  def baria_book
  @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end
def user_params
  params.require(:user).permit(:name, :profile_image,:introduction)
end
end
