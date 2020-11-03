class GroupTag < ApplicationRecord
    belongs_to :group 
    belongs_to :tag 

    accepts_nested_attributes_for :tag

    validates :tag, :group, presence: true
    validates :tag_id, :uniqueness => {:scope => :group_id}
    validates :group_id, :uniqueness => {:scope => :tag_id}
end
