module LikeHelper
  #     def like_button(tweet)
  #         like = Like.find_by(tweet: tweet, user: current_user)
  #         unless like
  #           form_with url: tweet_likes_path(user), method: :post do |form|
  #             form.submit <i class="far fa-heart"></i>
  #           end
  #         else
  #           form_with url: post_like_path(user), method: :delete do |form|
  #             form.submit <i class="far fa-heart"></i> , class: "text-danger"
  #           end
  #         end
  #       end

  def like_btn(tweet)
    like = Like.find_by(tweet: tweet, user: current_user)
    if like
      link_to('Dislike!', tweet_like_path(id: like.id, tweet_id: tweet.id), method: :delete)
    else
      link_to('Like!', tweet_likes_path(tweet_id: tweet.id), method: :post)
    end
  end
end
