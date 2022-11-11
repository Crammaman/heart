class Card < ApplicationRecord

  # List of available card views.
  @views = Dir.entries('app/views/cards/views').select { |e| e.match?(/.html.erb$/) }.map { |v| OpenStruct.new(name: v[1..-10].humanize, value: v[1..-10]) }

  def self.views
    @views
  end

  def device
    @device ||= Device.find(config[:device_id])
  end
end
