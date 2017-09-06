class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def edit?
    user&.admin?
  end

  def update?
    user&.admin?
  end

  def new?
    user&.admin?
  end

  def create?
    user&.admin?
  end

  def destroy?
    user&.admin?
  end

  def show?
    true
  end

  def index?
    true
  end
end

