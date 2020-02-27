class RemoveBookedFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :booked
  end
end
