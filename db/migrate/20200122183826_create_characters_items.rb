class CreateCharactersItems < ActiveRecord::Migration[5.2]
  def change
    create_table :characters_items, id: false do |t|
      t.belongs_to :character, index: true
      t.belongs_to :item, index: true
    end
  end
end
