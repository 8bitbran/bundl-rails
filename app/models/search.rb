class Search < ApplicationRecord

    def search_tags
        tags = Tag.all 

        tags = tags.where(['name LIKE ?', name])

        return tags
    end

end
