class LikesController < ApplicationController
  def create
    @like = User.find(session[:id]).likes.new(tweet_id: params[:tweet_id])

    redirect_to root_path if @like.save
  end

  def destroy
    like = Like.find_by(id: params[:id], user: User.find(session[:id]), tweet_id: params[:tweet_id])
    like.destroy
    redirect_to root_path
  end
end
