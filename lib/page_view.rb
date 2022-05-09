# frozen_string_literal: true

# The PageView class initialize with parsed data and returns all/uniq ordered views
class PageView
  # initialize with parsed data
  def initialize(parsed_data)
    @parsed_data = parsed_data
  end

  # returns a hash of webpages with their number of views
  def list(unique: false)
    views = parse_views(unique)
    order_views(views)
  end

  private

  attr_reader :parsed_data

  def parse_views(unique)
    parsed_data.transform_values do |value|
      (unique ? value.uniq : value).size
    end
  end

  # order webpage views by number of views then page name
  def order_views(visits)
    Hash[visits.sort_by { |k, v| [-v, k] }]
  end
end
