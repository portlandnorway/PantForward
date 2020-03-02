class AddDefaultTipToCollections < ActiveRecord::Migration[5.2]
  def change
    change_column_default :collections, :tip, to: 0
  end
end
