class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :post_id
      t.integer :comment_id
      t.string :action, null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
      add_index :notifications, :visitor_id, unique: true
      add_index :notifications, :visited_id, unique: true
      add_index :notifications, :post_id, unique: true
      add_index :notifications, :comment_id, unique: true

  end
end
