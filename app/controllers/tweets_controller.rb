class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.ordered_by_most_recent
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
    if @tweet.save
      redirect_to root_path, notice: 'Tweet successfully created'
    end
  end

  def edit 
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to root_path, notice: "Tweet updated"
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
