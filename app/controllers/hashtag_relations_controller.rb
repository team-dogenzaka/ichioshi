class Hashtag_relationsController < ApplicationController

  def create
    @review.hashtag_relations.create(hashtag_id: params[:hashtag_id])
  end

  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
  end
end
