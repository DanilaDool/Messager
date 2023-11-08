class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :sent_friend_requests, foreign_key: :sender_id, class_name: 'FriendRequest'
  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: 'FriendRequest'

    def accepted_friends
      self.friends.joins(:friendships).where(friendships: { status: "accepted" })
    end

  def pending_friend_requests
    sent_friend_requests.where(accepted: false)
  end
end
