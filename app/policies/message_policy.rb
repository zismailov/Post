class MessagePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    is_sender_or_receiver?
  end

  def destroy?
    is_sender_or_receiver?
  end

  def edit?
    update?
  end

  def update?
    is_sender_or_receiver?
  end

  def manage?
    is_sender_or_receiver?
  end

  def update_status?
    is_sender_or_receiver?
  end

  private

  def is_sender_or_receiver?
    is_sender? || is_receiver?
  end

  def is_sender?
    record.sender == user
  end

  def is_receiver?
    record.receiver == user
  end
end
