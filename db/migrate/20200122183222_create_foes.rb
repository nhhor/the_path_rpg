class CreateFoes < ActiveRecord::Migration[5.2]
  def change
    create_table :foes do |t|
      t.string "foe_name"
      t.integer "foe_health"
    end
  end
end
