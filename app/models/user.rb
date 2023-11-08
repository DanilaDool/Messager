class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :friendships
  has_many :friends, through: :friendships

    def accepted_friends
      self.friends.joins(:friendships).where(friendships: { status: "accepted" })
    end

end
