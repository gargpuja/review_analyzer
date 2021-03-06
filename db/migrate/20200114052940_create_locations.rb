class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.float :rating
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
