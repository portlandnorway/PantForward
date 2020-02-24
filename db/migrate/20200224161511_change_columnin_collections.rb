class ChangeColumninCollections < ActiveRecord::Migration[5.2]
  def change
    change_column :collections, :status, :integer, default: 0
  end
end
