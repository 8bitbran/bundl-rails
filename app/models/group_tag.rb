class GroupTag < ApplicationRecord
    has_one :group 
    has_one :tag 

    accepts_nested_attributes_for :tags

    validates :tag, :group, presence: true
    validates :tag_id, :uniqueness => {:scope => :group_id}
    validates :group_id, :uniqueness => {:scope => :tag_id}
end
