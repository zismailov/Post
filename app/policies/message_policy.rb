# frozen_string_literal: true

class MessagePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    sender_or_recipient?
  end

  def destroy?
    sender_or_recipient?
  end

  def edit?
    update?
  end

  def update?
    sender_or_recipient?
  end

  def manage?
    sender_or_recipient?
  end

  def update_status?
    sender_or_recipient?
  end

  private

  def sender_or_recipient?
    sender? || recipient?
  end

  def sender?
    record.sender == user
  end

  def recipient?
    record.user_messages.map(&:user).include?(user)
  end
end
