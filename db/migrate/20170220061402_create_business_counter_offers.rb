class CreateBusinessCounterOffers < ActiveRecord::Migration
  def change
    create_table :business_counter_offers do |t|
      t.references :business, index: true, foreign_key: true
      t.references :charity_offer, index: true, foreign_key: true
      t.string :shortCode, limit: 6
      t.string :shortDescription
      t.string :longDescription
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
