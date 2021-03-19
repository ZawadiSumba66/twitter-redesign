class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      session[:username] = @user.username
      redirect_to root_path, notice: 'You have successfully signed up'
    else
      render :new, alert: 'username has alraedy been taken'
    end
  end

  def show
    @user = User.find(params[:id])
    @personal_tweets = @user.authored_tweets.order('created_at DESC')
  end

  def sign_in
    @user = User.find_by(username: params[:username])

    if @user
      session[:id] = @user.id
      session[:username] = @user.username
      redirect_to root_path, notice: 'You have successfully signed in'
    else
      render :log_in, alert: 'User does not exist'
    end
  end

  # display log in form
  def log_in; end

  def log_out
    session.delete(:id)
    session.delete(:username)
    session.delete(:fullname)
    redirect_to users_sign_in_path, notice: 'You have successfully logged out'
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname)
  end
end
