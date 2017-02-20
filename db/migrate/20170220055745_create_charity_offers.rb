class CreateCharityOffers < ActiveRecord::Migration
  def change
    create_table :charity_offers do |t|
      t.references :charity, index: true, foreign_key: true
      t.string :shortCode, limit: 6
      t.string :shortDescription
      t.string :longDescription
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
