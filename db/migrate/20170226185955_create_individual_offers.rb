class CreateIndividualOffers < ActiveRecord::Migration
  def change
    create_table :individual_offers do |t|
      t.references :individual, index: true, foreign_key: true
      t.references :charity_offer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
