class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :country
      t.string :city
      t.boolean :email_notification

      t.timestamps null: false
    end
  end
end
