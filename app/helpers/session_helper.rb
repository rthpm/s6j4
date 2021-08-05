module SessionHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def rights_user?(object)
    redirect_to gossip_path(@comment.gossip.id) if current_user.id != object.user.id
  end

  def authenticate_user
    unless current_user
      flash[:danger] = 'Please log in.'
      redirect_to new_session_path
    end
  end

  def authenticate_current_user
    unless current_user == Gossip.find(params[:id]).user || current_user == Comment.find(params[:id]).user
      redirect_to gossip_path(params[:id]), alert: 'Vous ne pouvez pas modifier ce potin/commentaire'
    end
  end

  def liked?(gossip, user)
    Like.where(gossip_id: gossip.id, user_id: user.id).exists?
  end
end
