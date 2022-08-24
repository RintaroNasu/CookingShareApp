class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :cooks, dependent: :destroy
  has_many :likes_cooks, through: :likes, source: :cook
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  def already_liked?(cook)
    self.likes.exists?(cook_id: cook.id)
  end
end
