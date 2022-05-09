# frozen_string_literal: true

require_relative 'page_view'
# The FormattedOutput will print the total and unique views
class FormattedOutput
  # initialize with page_views hash
  def initialize(views)
    @views = views
  end

  # print page views
  def call(header, view_type)
    print_header(header, view_type)
    views.each do |page, views|
      print "#{page} #{views} #{view_type}.\n"
    end
    print "#{'=' * 30}\n"
  end

  private

  attr_reader :views

  def print_header(header, _view_type)
    print "\n#{header}\n"
    print "#{'=' * 30}\n"
  end
end
