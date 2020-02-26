class AddNeighborhoodToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :neighborhood, :string
  end
end
