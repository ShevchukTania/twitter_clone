class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @user = current_user
    @tweets = Tweet.for_users((current_user.followings).pluck(:id)).paginate(:page => params[:page])
  end

  def search
    @names = params[:user_name]
    @users = User.where(["first_name LIKE :name OR last_name LIKE :name", name: "%#{params[:user_name]}%"]).paginate(:page => params[:page])
  end
end
