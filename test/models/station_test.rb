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

require 'test_helper'

class StationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
