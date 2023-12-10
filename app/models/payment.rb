class Payment < ApplicationRecord
  belongs_to :sender, class_name: 'Customer'
  belongs_to :recipient, class_name: 'Customer'

  validates :recipient, exclusion: { in: ->(payment) { [payment.sender] } }
end