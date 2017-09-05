class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    user.admin? || @comment.owner == current_user
  end

  def update?
    user.admin? || @comment.owner == current_user
  end
end


