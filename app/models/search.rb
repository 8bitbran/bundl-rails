class Search < ApplicationRecord

    def search_tags
        tags = Tag.all 

        tags.where(['name LIKE ?', name]) if name.present?
    end

end
