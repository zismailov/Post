class MessagePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    is_sender_or_recipient?
  end

  def destroy?
    is_sender_or_recipient?
  end

  def edit?
    update?
  end

  def update?
    is_sender_or_recipient?
  end

  def manage?
    is_sender_or_recipient?
  end

  def update_status?
    is_sender_or_recipient?
  end

  private

  def is_sender_or_recipient?
    is_sender? || is_recipient?
  end

  def is_sender?
    record.sender == user
  end

  def is_recipient?
    record.recipients.includes(:user).map(&:user).include?(user)
  end
end
