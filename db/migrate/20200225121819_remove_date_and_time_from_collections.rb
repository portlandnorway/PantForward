class RemoveDateAndTimeFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :date
    remove_column :collections, :time
    remove_column :collections, :user_id
  end
end
