class Group < ApplicationRecord
    validates :name, presence: true, length: { minimum: 5, maximum: 64 }
    validates :description, presence: true, length: { minimum: 50, maximum: 500 }
    validates :location, presence: true
    has_one :topic
    belongs_to :user
    has_many :memberships
    has_many :members, through: :memberships, source: :user
    has_many :events
    has_many :rsvps, through: :events
    has_many :discussions
    has_many :group_tags
    has_many :tags, through: :group_tags
    accepts_nested_attributes_for :group_tags
end
