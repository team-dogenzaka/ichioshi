class DiscoversController < ApplicationController
  def index
    @categories = Category.all    
  end
end
