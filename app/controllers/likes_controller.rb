class LikesController < ApplicationController
  def create
    @like = User.find(session[:id]).likes.new(tweet_id: params[:tweet_id])

    if @like.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: User.find(session[:id]), tweet_id: params[:tweet_id])
    if like
      like.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
