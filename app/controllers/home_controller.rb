class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
    @user = current_user
  end
end
