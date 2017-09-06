class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    return false unless logged_in?
    user.admin? || @comment.owner == user
  end

  def update?
    return false unless logged_in?
    user.admin? || @comment.owner == user
  end

  def new?
    logged_in?
  end

  def create?
    logged_in?
  end

  def destroy?
    return false unless logged_in?
    user.admin? || @comment.owner == user
  end

  private

  def logged_in?
    !@user.nil?
  end
end


