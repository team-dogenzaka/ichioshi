class ItemsController < ApplicationController
    include TagManager

***　略 ***

private
    def item_params
        params.require(:item).permit(
            :name, :category_id, :subcategory_id, :authors, :add_tags, tag_list: [])
    end
end