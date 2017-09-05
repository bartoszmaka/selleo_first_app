class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
end
