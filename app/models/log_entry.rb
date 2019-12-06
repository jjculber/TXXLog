class LogEntry < ApplicationRecord
  belongs_to :event
  belongs_to :station
  belongs_to :user
end
