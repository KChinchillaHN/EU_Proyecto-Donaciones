class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :author
      t.text :message
      t.decimal :amount
      t.references :campaign, index: true

      t.timestamps null: false
    end
  end
end
