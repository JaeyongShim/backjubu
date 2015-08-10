class AddRateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :rate, :integer
  end
end
