class CityController < ApplicationController
  def show
    @all_gossips = []
    @city = City.find(params['id'])
    City.all.each do |city|
      city.users.where(city_id: params[:id]).each do |user|
        user.gossips.each do |gossip|
          @all_gossips << gossip
        end
      end
    end
  end
end
