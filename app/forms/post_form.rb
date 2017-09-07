class PostForm < Patterns::Form
  param_key 'post'

  attribute :title, String
  attribute :content, String
  attribute :images, JSON
  attribute :user_id, Integer

  validates :title, :content, presence: true

  private

  def persist
    resource.update_attributes(attributes)
  end
end
