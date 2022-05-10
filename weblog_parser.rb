# frozen_string_literal: true

require_relative 'lib/web_page_logger'

begin
  WebPageLogger.new(ARGV[0]).call
rescue => e
  puts "Error:: #{e}"
end
