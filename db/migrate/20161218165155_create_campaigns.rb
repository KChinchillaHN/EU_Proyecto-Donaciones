class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.text :review
      t.decimal :goal
      t.string :category
      t.string :image_url
      t.references :user, index: true
      t.integer :number_likes
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
