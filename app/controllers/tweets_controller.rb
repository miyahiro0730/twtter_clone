class TweetsController < ApplicationController
  before_action:current_user_check, only:[:new, :edit, :destroy]
  before_action:set_tweet, only:[:edit, :update, :destroy]
  before_action:get_tweet_list, only:[:index, :confirm, :create]

  def index

    # ツイート投稿保持
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end

  end

  #編集画面
  def edit
  end

  #編集処理
  def update
    if @tweet.update(tweet_params)
      #成功の場合
      redirect_to tweets_path, notice: 'つぶやきの編集が完了しました'
    else
      #失敗の場合
      render 'edit'
    end
  end

  #削除処理
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: 'つぶやきの削除が完了しました'
  end

  #新規作成処理
  def create

    @tweet = Tweet.new(tweet_params)

    unless @tweet.image.url.nil?
      @tweet.image.retrieve_from_cache! params[:cache][:image]
      @tweet.save!
    end

    if @tweet.save
      redirect_to tweets_path, notice: '新規のつぶやきが完了しました'

    else

      render confirm_tweets_path
    end
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render:index if @tweet.invalid?
  end

  # def show
  #
  # end

private
  def tweet_params
    # raise
    params.require(:tweet).permit(:content, :user_id, :image)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def get_tweet_list
    @list = Tweet.all
  end

  # ログインしていないのに入る
  def current_user_check
    if !current_user
      redirect_to tweets_path, notice: 'ログインしていない'
    end
  end

end
