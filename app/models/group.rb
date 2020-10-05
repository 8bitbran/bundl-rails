class Group < ApplicationRecord
    validates :name, presence: true, length: { minimum: 5, maximum: 64 }
    validates :description, presence: true, length: { minimum: 50, maximum: 500 }
    validates :location, presence: true
end
