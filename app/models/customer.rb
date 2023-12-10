class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :balance, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

  has_many :sender_payments, class_name: 'Payment', foreign_key: 'sender_id'
  has_many :recipient_payments, class_name: 'Payment', foreign_key: 'recipient_id'
end
