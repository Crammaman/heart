class Recording < ApplicationRecord
  belongs_to :device

  include Filterable
  scope :filter_by_from_date, ->(date) { where(created_at: (DateTime.parse(date)..)) }
  scope :filter_by_to_date, ->(date) { where(created_at: (..DateTime.parse(date))) }
  scope :filter_by_device_id, ->(device_id) { where(device_id: device_id) }

end
