class RemoveColumnsFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :donator_id
    remove_column :collections, :collector_id
  end
end
