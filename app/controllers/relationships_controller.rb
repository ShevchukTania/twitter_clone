class RelationshipsController < ApplicationController
  before_action :current_user

  def create
    followed = User.find(params[:id])
    current_user.follow(followed)
    redirect_back(fallback_location: root_path, info: 'Followed')
  end

  def destroy
    relationship = Relationship.find_by(id: params[:id])
    relationship.destroy
    redirect_back(fallback_location: root_path, info: 'Unfollowed')
  end

  private
  
  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id)
  end
end
