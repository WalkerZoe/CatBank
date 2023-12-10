class SendPaymentService < ApplicationService
  def initialize(payment)
    @payment = payment
  end

  def call
    ActiveRecord::Base.transaction do
      sender.subtract_from_balance(amount)
      recipient.add_to_balance(amount)
    end
    rescue ActiveRecord::RecordInvalid => exception
  end

  private

  attr_reader :payment

  def sender
    @sender ||= Customer.find(payment.sender_id)
  end

  def recipient
    @recipient ||= Customer.find(payment.recipient_id)
  end

  def amount
    @amount ||= payment.amount
  end
end