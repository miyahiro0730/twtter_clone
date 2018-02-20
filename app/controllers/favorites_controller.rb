class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    redirect_to tweets_url, notice: "#{favorite.tweet.user.name}さんのツイートをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to tweets_url, notice: "#{favorite.tweet.user.name}さんのツイートをお気に入り解除しました"
  end
end
