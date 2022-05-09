# frozen_string_literal: true

# This file manage different exceptions
class EmptyLogFile < StandardError
end

class FileNotFound < StandardError
end

class InvalidDataFormat < StandardError
end

class InvalidFileFormat < StandardError
end
