class Event < ApplicationRecord
    validates :title, presence: true, length: { minimum: 16, maximum: 64 }
    validates :description, presence: true, length: { minimum: 50, maximum: 500 }
    validates :location, presence: true
    belongs_to :group
    has_many :rsvps
    has_many :members, through: :rsvp, source: :user
end
