class AddBookedToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :booked, :boolean, default: false
  end
end
