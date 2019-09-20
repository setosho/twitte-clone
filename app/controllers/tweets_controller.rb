class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "ツイートを投稿しました"
    else
      render :new
    end
  end

  def edit
    #@tweet = Tweet.find(params[:id])
  end

  def update
    #@tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "ツイートを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "ツイートを削除しました"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
