class Group < ApplicationRecord
    validates :name, presence: true, length: { minimum: 5, maximum: 64 }
    validates :description, presence: true, length: { minimum: 50, maximum: 500 }
    validates :location, presence: true
    belongs_to :topic
    belongs_to :user
    has_many :memberships, dependent: :destroy
    has_many :members, through: :memberships, source: :user
    has_many :events, dependent: :destroy
    has_many :rsvps, through: :events
    has_many :discussions, dependent: :destroy
    has_many :group_tags, dependent: :destroy
    has_many :tags, through: :group_tags
    accepts_nested_attributes_for :group_tags

    def self.search(search)
        if search 
            where(["name LIKE ?","%#{search}%"])
        else
            all
        end
    end 

    def tag_list 
        self.tags.map { |t| t.name }.join(", ")
    end 

    def tag_list=(value)
        tag_names = value.split(/,\s+/)
        
        self.tags = tag_names.map { |name| Tag.where('name = ?', name).first or Tag.create(:name => name) }
    end 
end
