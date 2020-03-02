class AddDefaultTipToCollections < ActiveRecord::Migration[5.2]
  def change
    change_column :collections, :tip, :integer, default: 0
  end
end
