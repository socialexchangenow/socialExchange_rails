class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.references :individual, index: true, foreign_key: true
      t.references :charity_offer, index: true, foreign_key: true
      t.references :business_counter_offer, index: true, foreign_key: true
      t.datetime :expectedDate
      t.boolean :fulfilled
      t.datetime :fulfilledDate

      t.timestamps null: false
    end
  end
end
