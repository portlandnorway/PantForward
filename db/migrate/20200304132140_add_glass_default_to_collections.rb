class AddGlassDefaultToCollections < ActiveRecord::Migration[5.2]
  def change
    change_column :collections, :glass, :boolean, default: false
  end
end
