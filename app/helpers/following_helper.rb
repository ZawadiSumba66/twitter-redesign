module FollowingHelper
    def follow(user)
      return if current_user == user
  
      if current_user.following?(user)
        form_with url: following_path(user), method: :delete, class: 'relative', data: { remote: true } do |form|
          form.submit 'Unfollow'
        end
      else
        form_with url: new_following_path(user), method: :post do |form|
          form.submit 'Follow'
        end
      end
    end
  end
  