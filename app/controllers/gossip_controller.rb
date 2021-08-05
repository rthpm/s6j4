class GossipController < ApplicationController
  include SessionHelper
  before_action :authenticate_user, except: %i[index show]

  def welcome; end

  def index
    @gossip = Gossip.new
    @all_gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)

    if @gossip.save
      flash[:notice] = 'Gossip envoyé !'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    rights_user?(@gossip)
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.permit(:title, :content)
    if @gossip.update(gossip_params)
      flash[:notice] = 'Gossip mis à jour !'
      redirect_to gossip_path(@gossip.id)
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end
end
