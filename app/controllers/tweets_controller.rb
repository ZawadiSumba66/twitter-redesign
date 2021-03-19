class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all.order("created_at DESC")
        @users = User.all.order("created_at DESC")
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
          redirect_to root_path
        end
      end
  
      private
      
      def tweet_params
        params.require(:tweet).permit(:text, :author_id)
      end
end