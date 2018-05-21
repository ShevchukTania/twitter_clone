class RelationshipsController < ApplicationController
  before_action :current_user

  def create
  followed = User.find(params[:id])
  follower = current_user
  current_user.follow(follower, followed)
  redirect_to users_path
  end

  def destroy
  user = current_user.active_relationships.where(followed_id = '5')
  current_user.unfollow(user)
  redirect_to users_path
  end
private
  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id)
  end
end
