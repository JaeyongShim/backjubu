class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
			t.string :content
			t.integer :user_id
			t.references :post, index: true
      t.timestamps
    end
		add_foreign_key :comments, :posts
  end
end
