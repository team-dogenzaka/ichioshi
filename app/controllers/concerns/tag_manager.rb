module TagManager
  extend ActiveSupport::Concern

  included do
    def update_tags
      # チェックボックスの中身
      tag_list = params[model_name.downcase][:tag_list]

      # 消されたタグ = 元のタグ - チェックされたタグ
      remove_tags = @resource.tag_list - tag_list
      @resource.tag_list.remove(remove_tags) if remove_tags

      # 追加されたタグ
      add_tags = params[model_name.downcase][:add_tags]
      if add_tags
         # default_parserはコンマですが、半角/全角スペースもタグの区切りとみなします
        add_tags_array = add_tags.gsub(/[[:blank:]]+/, ',').split(',')
        @resource.tag_list.add(add_tags_array)
      end

      if @resource.save
        flash[:notice] = 'タグを更新しました'
      else
        flash[:notice] = 'タグの更新に失敗しました'
      end
      redirect_to :back
    end
  end
end