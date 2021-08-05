class LikeController < ApplicationController
  include SessionHelper
  before_action :authenticate_user, only: %i[create destroy]

  def create
    @like = Like.create(user_id: current_user.id, gossip_id: params[:gossip_id]) unless liked?
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @like = @gossip.likes.find(params[:id])
    @like.delete
    redirect_back(fallback_location: root_path)
  end

  private

  def liked?
    Like.where(gossip_id: params[:gossip_id], user_id: current_user.id).exists?
  end
end
