# frozen_string_literal: true

require_relative 'exceptions'
# The Parser class responsible to read log file and
# return parsed data in hash. Raise exception if any
class Parser
  # initialize with log file
  def initialize(log_file)
    @log_file = log_file
  end

  # read logs from file and returns parsed data in hash.
  def parse
    logs = File.open(log_file, 'r').read
    raise EmptyLogFile if logs.empty?

    parse_logs(logs)
  end

  private

  attr_reader :log_file

  def parse_logs(logs)
    parsed_data = Hash.new { |h, k| h[k] = [] }
    logs.each_line do |line|
      path, location = line.split
      raise InvalidDataFormat if [path, location].include?(nil)

      parsed_data[path] << location
    end
    parsed_data
  end
end
