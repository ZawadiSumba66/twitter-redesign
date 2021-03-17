class FollowingsController < ApplicationController
    def new
        @following = Following.new
    end

    def create
        user = User.find(params[:user_id])
        current_user.follow(user)
    
        redirect_to :root_path
    end

        def destroy
            @following = Following.find(params[:id])
            current_user.unfollow(user)

            redirect_to root_path
        end
end