class RelationshipsController < ApplicationController
  before_action :current_user

  def create
    followed = User.find(params[:id])
    current_user.follow(followed)
    redirect_to users_path
  end

  def destroy
    relationship = Relationship.find_by(id: params[:id])
    relationship.destroy
    
    redirect_to users_path
  end

  private

  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id)
  end
end
