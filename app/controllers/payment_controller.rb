class PaymentController < ApplicationController
  before_action :authenticate_customer!

  def index
    render
  end

  def new
    unless Customer.exists?(email: recipient_email)
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Customer with email #{recipient_email} does not exist"
      return
    end

    params[:recipient_id] = Customer.find_by(email: recipient_email).id

    payment = Payment.create(payment_params)
    if SendPaymentService.call(payment)
      payment.save!
      redirect_to root_path, alert: "Money sent successfully to #{recipient_email}"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Failed to send money to #{recipient_email}"
    end
  end

  private

  def payment_params
    params.permit(:sender_id, :recipient_id, :amount)
  end

  def recipient_email
    @recipient_email ||= params[:recipient_email]
  end
end