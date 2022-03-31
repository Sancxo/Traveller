class User < ApplicationRecord
    EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, presence: true
    validates :email, presence: true, format: {with: EMAIL_FORMAT}, uniqueness: true

    has_one_attached :profile_picture do |attachable|
        attachable.variant :avatar, resize_to_limit: [300, 300]
    end

    validates :profile_picture, content_type: ['image/png', 'image/jpeg', 'imafe/gif', 'image/webp', 'image/avif']

    has_many :posts, dependent: :destroy

    before_save {self.email = email.downcase}

    has_secure_password
end
