class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :address
      t.integer :tip
      t.integer :bottles
      t.string :details
      t.integer :status
      t.date :date
      t.time :time
      t.references :user, foreign_key: true
    end
  end
end
