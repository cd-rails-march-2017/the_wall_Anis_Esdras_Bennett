class UsersController < ApplicationController
  def index
    if session[:id]
      redirect_to "posts/index"
    else
      render "index"
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to "/posts", notice: "You have successfully registered!"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def new

  end

  def login
    @user = User.find_by(username: params[:user]['username']) || User.find_by(username: params[:user]['username'])
    if @user
      if @user.password == params[:user]['password']
        session[:id] = @user.id
        redirect_to '/posts'
      else
        flash[:errors] = 'Password does not match!'
        redirect_to :back
      end
    else
      flash[:errors] = 'The username/email does not exist!'
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
