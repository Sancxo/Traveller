class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    has_one_attached :photo do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
        attachable.variant :medium, resize_to_limit: [300, 300]
    end

    validates :photo, content_type: ['image/png', 'image/jpeg', 'imafe/gif', 'image/webp', 'image/avif']

    belongs_to :user

    geocoded_by :address
    after_validation :geocode, if: :address_changed?
end
