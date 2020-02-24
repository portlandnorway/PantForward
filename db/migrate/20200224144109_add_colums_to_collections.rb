class AddColumsToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :created_at, :datetime, null: false
    add_column :collections, :updated_at, :datetime, null: false
  end
end
