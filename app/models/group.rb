class Group < ApplicationRecord
    validates :name, presence: true, length: { minimum: 5, maximum: 64 }
    validates :description, presence: true, length: { minimum: 50, maximum: 500 }
    validates :location, presence: true
    has_one :topic
    has_one :admin, source: :user
    has_many :memberships
    has_many :members, through: :memberships, source: :user
    has_many :events
    has_many :rsvps, through: :events
end
