module LikeHelper
  def like_btn(tweet)
    like = Like.find_by(tweet: tweet, user: current_user)
    if like
      link_to('Dislike!', tweet_like_path(id: like.id, tweet_id: tweet.id), method: :delete)
    else
      link_to('Like!', tweet_likes_path(tweet_id: tweet.id), method: :post)
    end
  end
end
