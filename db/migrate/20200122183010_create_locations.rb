class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string "location_name"
      t.string "location_description"
      t.timestamps()
    end
  end
end
