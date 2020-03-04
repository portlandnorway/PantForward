class AddGlassToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :glass, :boolean
  end
end
