class TweetsController < ApplicationController
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

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content)
  end
end
