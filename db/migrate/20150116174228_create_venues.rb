class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :status
      t.integer :capacity
      t.string :name
      t.string :url
      t.string :short_address
      t.string :fbid
      t.string :email
      t.integer :phone
      t.string :address
      t.integer :lat
      t.boolean :checked
      t.integer :lng
      t.integer :original_id
      t.text :description

      t.timestamps
    end
  end
end
