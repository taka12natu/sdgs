class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.string :image
      t.text :content
      t.timestamps
    end
  end
end
