class AddPaymentModel < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :sender, null: false
      t.references :recipient, null: false
      t.integer :amount, null: false
      t.timestamps
    end
    add_foreign_key :payments, :customers, column: :sender_id
    add_foreign_key :payments, :customers, column: :recipient_id
  end
end