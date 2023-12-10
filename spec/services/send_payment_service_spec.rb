require "rails_helper"

RSpec.describe SendPaymentService do
  describe '.call' do
    subject { described_class.call(payment) }
    let(:sender) { Customer.create!(email: 'an_email@example.com', password: 'password') }
    let(:recipient) { Customer.create!(email: 'another_email@example.com', password: 'password2') }
    let(:payment) { Payment.create!(sender: sender, recipient: recipient, amount: amount) }

    context 'when service is called with valid parameters' do
      let(:amount) { 50 }
      it 'updates both customers\' balances' do
        expect { subject }.to change { recipient.reload.balance }.from(100).to(150).and(
          change { sender.reload.balance }.from(100).to(50)
        )
      end
    end

    context 'when service is called with value greater than sender\'s balance' do
      let(:amount) { 1000 }
      it 'does not create payment or update customers' do
        expect { subject }.to not_change { recipient.reload.balance }.from(100).and(
          not_change { recipient.reload.balance }.from(100)
        )
      end
    end
  end
end