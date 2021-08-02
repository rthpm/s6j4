class GossipController < ApplicationController
  def welcome; end

  def index
    @all_gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params['id'])
  end
end
