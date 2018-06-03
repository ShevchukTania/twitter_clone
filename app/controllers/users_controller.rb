class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :init_new_user, only: [:show, :edit, :update, :followers, :followings]

  def index
    @users = User.paginate(:page => params[:page])
    @tweets = Tweet.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_path
    else
      render :new
    end
  end

  def show
      @tweets = @user.tweets.paginate(:page => params[:page])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def followers
  end

  def followings
  end

  def tweets
    @user = User.find(params[:user_id])
    @tweets = @user.tweets.paginate(:page => params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end

  def init_new_user
    @user = User.find(params[:id])
  end
end
