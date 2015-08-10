class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :rating
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
