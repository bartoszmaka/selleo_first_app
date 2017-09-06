class PostForm < Patterns::Form
  attribute :title, String
  attribute :content, String

  validate :title, :content, presence: true

  private

end
