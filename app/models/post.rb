class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
end
