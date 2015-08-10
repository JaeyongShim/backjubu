class RemoveRateFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :rate, :integer
  end
end
