class CreateEncounters < ActiveRecord::Migration[5.2]
  def change
    create_table :encounters do |t|
        t.belongs_to :character, index: true
        t.belongs_to :location, index: true
        t.belongs_to :rival, index: true
    end
  end
end
