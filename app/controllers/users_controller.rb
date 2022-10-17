class UsersController < ApplicationController
  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
     redirect_to book_path(@book.id)
    end
  end

  def index
    #@user = User.find(params[:id])
    @user = current_user
    @users = User.all
    #@books = @user.books
    @book = Book.new
  end

  # def create
  #   @book = Book.new(book_params)
  #   @book.user_id = cuurent_user.id
  #   if @book.save
  #     flash[:notice] = "You have creatad book successfully."
  #     redirect_to books_path(@book.id)
  #   else
  #     @books = Book.all
  #     render :index
  #   end
  # end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    #@user = current_user
    if @user == current_user
       render :edit
    else
       redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice]="You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private
  def user_params
    #params.require(:user).permit(:name)
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  # def book_params
  #     params.require(:book).permit(:title, :body)
  # end

end
