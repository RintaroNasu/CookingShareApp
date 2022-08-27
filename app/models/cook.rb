class Cook < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    validates :cooking_name, presence: true
    validates :how_to_make, presence: true
    validates :image, presence: true
    validates :easy, presence: true
    validates :deliciousness, presence: true
end
