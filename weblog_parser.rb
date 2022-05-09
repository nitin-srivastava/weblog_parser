# frozen_string_literal: true

require_relative 'lib/web_page_logger'

WebPageLogger.new(ARGV[0]).call
