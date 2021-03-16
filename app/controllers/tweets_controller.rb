class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all  
    end
    def new
        @tweet = Tweet.new
      end
    
      def show
        @tweet = Tweet.find(params[:id])
      end
    
      def create
        @tweet = User.find(session[:id]).tweet.build(tweet_params)
        if @tweet.save
          redirect_to @tweets
        else
          render :new
        end
      end
      def tweet_params
        params.require(:tweet).permit(:Text)
      end
end