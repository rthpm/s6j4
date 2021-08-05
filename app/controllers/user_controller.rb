class UserController < ApplicationController
  include SessionHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
      age: params[:age],
      city: City.find(params[:city]),
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      flash[:notice] = 'Compte créé avec succès !'
      log_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params['id'])
  end
end
