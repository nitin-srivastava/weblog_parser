# frozen_string_literal: true

# This file manage different exceptions
class EmptyLogFile < StandardError
  def initialize(msg = 'log file is empty.')
    super
  end
end

class FileNotFound < StandardError
  def initialize(msg = "file doesn't exist.")
    super
  end
end

class InvalidDataFormat < StandardError
  def initialize(msg = 'file has invalid data format.')
    super
  end
end

class InvalidFileFormat < StandardError
  def initialize(msg = 'invalid file extension. Only .log file accepted.')
    super
  end
end
