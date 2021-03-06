class Tag < ApplicationRecord
    has_many :group_tags
    has_many :groups, through: :group_tags

    validates :name, uniqueness: true
end
