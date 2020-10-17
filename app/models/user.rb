class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  accepts_nested_attributes_for :event
  accepts_nested_attributes_for :rsvp
  accepts_nested_attributes_for :group
  accepts_nested_attributes_for :membership
end
