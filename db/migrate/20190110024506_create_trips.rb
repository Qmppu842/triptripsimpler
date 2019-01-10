class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :start
      t.string :end
      t.integer :length
      t.integer :elo
      t.string :link

      t.timestamps
    end
  end
end
