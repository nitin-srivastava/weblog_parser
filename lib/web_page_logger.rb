# frozen_string_literal: true

require_relative 'exceptions'
require_relative 'parser'
require_relative 'result'

# The WebPageLogger call will initialize with a log file and return the result
# Raise an exception if log file doesn't exist.
class WebPageLogger
  def initialize(log_file)
    raise FileNotFound if log_file.nil? || !File.exist?(log_file)
    raise InvalidFileFormat unless File.extname(log_file).eql?('.log')

    @parsed_logs = Parser.new(log_file).parse
  end

  def call
    Result.new(parsed_logs).call
  end

  private

  attr_reader :parsed_logs
end
