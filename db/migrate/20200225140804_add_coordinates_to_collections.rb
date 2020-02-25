class AddCoordinatesToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :latitude, :float
    add_column :collections, :longitude, :float
  end
end
