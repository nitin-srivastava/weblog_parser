# frozen_string_literal: true

require_relative 'page_view'
require_relative 'formatted_output'

# The Result class initialize with parsed data and print the result.
class Result
  def initialize(parsed_data)
    @parsed_data = parsed_data
    @page_view = PageView.new(parsed_data)
  end

  def call
    total_views = page_view.list
    uniq_views = page_view.list(unique: true)
    FormattedOutput.new(total_views).call('Total Visits', 'visits')
    FormattedOutput.new(uniq_views).call('Unique Views', 'unique views')
  end

  private

  attr_reader :parsed_data, :page_view
end
