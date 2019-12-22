# == Schema Information
#
# Table name: stations
#
#  id          :integer          not null, primary key
#  description :string
#  uuid        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_stations_on_uuid  (uuid) UNIQUE
#

class Station < ApplicationRecord
  has_many :log_entries
end
