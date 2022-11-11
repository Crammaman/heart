module Filterable
  extend ActiveSupport::Concern

  class_methods do

    def filter params
      params.reduce(self.where(nil)) do |results, (attribute,value)|
        value.present? ? results.send("filter_by_#{attribute}", value) : results
      end
    end
  end
end