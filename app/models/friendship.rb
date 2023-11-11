class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :confirmed, inclusion: { in: [true, false] }
end
