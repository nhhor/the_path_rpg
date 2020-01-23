class CreateRivals < ActiveRecord::Migration[5.2]
  def change
    create_table :rivals do |t|
      t.string "rival_name"
      t.integer "rival_health"
    end
  end
end
