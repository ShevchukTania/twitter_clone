class TweetsController < ApplicationController
  def index
    @tweets = Tweet.for_users((current_user.followings).pluck(:id) << current_user.id).paginate(:page => params[:page])
  end

  def new
  	@tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to root_path, success: 'Tweet was created!'
    else
      redirect_to root_path, danger: 'Tweet was not created!'
    end
  end

  def update
  end

  def destroy
  	@tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_back(fallback_location: root_path, info: 'Tweet was deleted!')
  end

 private

 def tweet_params
 	params.require(:tweet).permit(:text)
 end

end
