class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :vote
      t.text :link
      t.text :user

      t.timestamps
    end
  end
end
