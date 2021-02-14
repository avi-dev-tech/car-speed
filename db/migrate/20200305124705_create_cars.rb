class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :slug
      t.integer :max_speed

      t.index [ :slug ], unique: true
      t.timestamps
    end
  end
end
