class DropPosts < ActiveRecord::Migration[7.1]
  def up
    drop_table :posts
  end

  def down
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end