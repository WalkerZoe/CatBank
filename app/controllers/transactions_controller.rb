class TransactionsController < ApplicationController
    before_action :authenticate_customer!
  
    def index
      @transactions = Payment.where(sender: current_customer).or(
        Payment.where(recipient: current_customer)
      ).includes(:sender, :recipient)
    end
  end