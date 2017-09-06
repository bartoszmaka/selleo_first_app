class Post < ApplicationRecord
  mount_uploaders :images, ImageUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy

  validates_uniqueness_of :title
end
