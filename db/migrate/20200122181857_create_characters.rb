class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string "character_name"
      t.integer "character_health"
      t.integer "user_id"
      t.timestamps()
    end
  end
end
