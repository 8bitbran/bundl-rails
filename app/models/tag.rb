class Tag < ApplicationRecord
    belongs_to :group_tag
    belongs_to :group

    validates :name, uniqueness: true
end
