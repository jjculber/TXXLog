class CreateLogEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :log_entries do |t|
      t.references :event, null: false, foreign_key: true
      t.datetime :contact_at
      t.string :callsign
      t.string :category
      t.string :section
      t.references :station, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.integer :frequency
      t.string :mode
      t.boolean :deleted

      t.timestamps
    end
  end
end
