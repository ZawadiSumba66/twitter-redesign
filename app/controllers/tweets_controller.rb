class TweetsController < ApplicationController
  def index
    @tweets = User.find(session[:id]).followings_posts
    @users = User.all.ordered_by_most_recent
    @tweet = Tweet.new
  end

  def new
    @tweet = User.find(session[:id]).tweets.build
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = User.find(session[:id]).authored_tweets.build(tweet_params)
    redirect_to root_path if @tweet.save
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
