class RemoveStatusFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :status
  end
end
