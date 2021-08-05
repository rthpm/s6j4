class SessionController < ApplicationController
  include SessionHelper

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      flash[:notice] = 'Connecté à une nouvelle session'
      log_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
