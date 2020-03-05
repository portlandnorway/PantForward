class AddNullsToCollections < ActiveRecord::Migration[5.2]
  def change
    change_column :collections, :glass, :boolean, default: false, null: false
  end
end
