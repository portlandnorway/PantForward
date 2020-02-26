class RemoveRewardFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :reward
  end
end
