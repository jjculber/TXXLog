# == Schema Information
#
# Table name: log_entries
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  contact_at :datetime
#  callsign   :string
#  category   :string
#  section    :string
#  station_id :integer          not null
#  user_id    :integer          not null
#  frequency  :integer
#  mode       :string
#  deleted    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LogEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
