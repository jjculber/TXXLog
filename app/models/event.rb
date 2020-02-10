# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  event_name          :string
#  callsign            :string
#  start_time          :datetime
#  end_time            :datetime
#  exchange            :string
#  location            :string
#  section             :string
#  category            :string
#  category_power      :string
#  wfd_bonus_offgrid   :boolean
#  wfd_bonus_outdoor   :boolean
#  wfd_bonus_remote    :boolean
#  wfd_bonus_satellite :boolean
#  contact_name        :string
#  contact_address     :string
#  contact_city        :string
#  contact_state       :string
#  contact_postal_code :string
#  contact_country     :string
#  contact_email       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Event < ApplicationRecord
  has_many :log_entries

  def to_csv
    log_entries.not_deleted.to_csv
  end
end
