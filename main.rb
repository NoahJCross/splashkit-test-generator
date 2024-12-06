#!/usr/bin/env ruby
require 'json'

require_relative 'src/models/models'
require_relative 'src/utils/message_handler'
require_relative 'src/parser'
require_relative 'src/test_writer'
require_relative 'src/language_config'
require_relative 'src/extensions/string_extensions'
require_relative 'src/utils/assertion_builder'
require_relative 'src/utils/value_formatter'
require_relative 'src/utils/function_lookup'

# Module responsible for generating test cases for SplashKit functions
module TestGenerator
  def self.generate(api_json)
    api = JSON.parse(api_json)
    functions = Parser.parse_functions(api)

    LanguageConfig::SUPPORTED_LANGUAGES.each do |language|
      dir_path = "generated_tests/#{language}"
      Dir.mkdir(dir_path) unless Dir.exist?(dir_path)
      # Generate test files
      TestWriter.write_integration_tests(functions, language)
    end
  end
end

# Check if API file is provided as argument
unless ARGV[0]
  puts MessageHandler.colorize('Usage: ruby main.rb path/to/api.json', '31')
  exit 1
end

# Read the API JSON file
begin
  api_json = File.read(ARGV[0])
  TestGenerator.generate(api_json)
  puts MessageHandler.colorize("Tests generated successfully in 'generated_tests' directory", '32')
rescue Errno::ENOENT
  puts MessageHandler.colorize("WARNING: Could not find file '#{ARGV[0]}'", '31')
  exit 1
rescue JSON::ParserError
  puts MessageHandler.colorize('WARNING: Invalid JSON file', '31')
  exit 1
end
