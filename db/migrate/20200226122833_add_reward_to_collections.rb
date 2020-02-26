class AddRewardToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :reward, :integer, default: 0
    add_column :collections, :big_bottles, :integer
    add_column :collections, :small_bottles, :integer
    remove_column :collections, :bottles
  end
end
