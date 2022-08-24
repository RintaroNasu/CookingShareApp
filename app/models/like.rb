class Like < ApplicationRecord
  belongs_to :cook
  belongs_to :user
  validates_uniqueness_of :cook_id, scope: :user_id
end
