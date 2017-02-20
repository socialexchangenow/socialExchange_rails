class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :shortCode, limit: 6
      t.string :shortDescription
      t.string :longDescription
      t.string :contactEmail
      t.string :contactPhone

      t.timestamps null: false
    end
  end
end
