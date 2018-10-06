class HashtagsController < ApplicationController

  def index
    @hashtags = Hashtag.all
    @tag =  ActsAsTaggableOn::Tag.all
    @review = Review.all
  end

end