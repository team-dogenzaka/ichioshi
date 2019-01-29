class BooksController < ApplicationController
  def search
    @category_name = Category.all
    if user_signed_in?
      if params[:back]
        @review = Review.new(review_params)
        @review.reviewtags.build
      else
        @review = Review.new
        @review.reviewtags.build
      end
    else
      redirect_to root_path, notice: "ログインしてね！"
    end
    
    if params[:keyword].present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      books = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'All',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp'
      )

      # 本のタイトル,画像URL, 詳細ページURLの取得
      @books = []
      books.items.each do |item|
        book = Book.new(
          item.get('ItemAttributes/Title'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL'),
        )
        @books << book
      end
    end
  end
end