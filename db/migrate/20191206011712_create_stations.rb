class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :uuid
      t.string :description

      t.timestamps
    end
    add_index :stations, :uuid, unique: true
  end
end
