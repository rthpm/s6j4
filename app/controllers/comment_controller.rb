class CommentController < ApplicationController
  include SessionHelper
  before_action :authenticate_user, except: %i[index show]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(content: params[:content], user: current_user, gossip_id: params[:gossip_id])

    flash[:notice] = 'Commentaire envoyé !' if @comment.save
    redirect_to gossip_path(@comment.gossip.id)
  end

  def edit
    @comment = Comment.find(params[:id])
    rights_user?(@comment)
  end

  def update
    @comment = Comment.find(params[:id])
    comment_params = params.permit(:content)
    if @comment.update(comment_params)
      flash[:notice] = 'Commentaire mis à jour !'
      redirect_to gossip_path(@comment.gossip.id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end
end
