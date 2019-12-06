class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :callsign
      t.datetime :start_time
      t.datetime :end_time
      t.string :exchange
      t.string :location
      t.string :section
      t.string :category
      t.string :category_power
      t.boolean :wfd_bonus_offgrid
      t.boolean :wfd_bonus_outdoor
      t.boolean :wfd_bonus_remote
      t.boolean :wfd_bonus_satellite
      t.string :contact_name
      t.string :contact_address
      t.string :contact_city
      t.string :contact_state
      t.string :contact_postal_code
      t.string :contact_country
      t.string :contact_email

      t.timestamps
    end
  end
end
