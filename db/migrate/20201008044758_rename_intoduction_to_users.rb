class RenameIntoductionToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :intoduction, :introduction
  end
end
