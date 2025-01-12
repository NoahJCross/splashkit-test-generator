require_relative 'test_runner/test_runner'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby run_tests.rb [options]"

  opts.on("-l", "--language LANGUAGE", "Language to test (cpp, python, pascal, rust, csharp)") do |lang|
    options[:language] = lang.to_sym
  end

  opts.on("-g", "--group GROUP", "Test group to run") do |group|
    options[:group] = group
  end

  opts.on("-t", "--test TEST", "Specific test to run") do |test|
    options[:test] = test
  end

  opts.on("-h", "--help", "Show this help message") do
    puts opts
    exit
  end
end.parse!

if ARGV.empty? && options.empty?
  # Add your TestRunner calls here
  # Examples:
  # TestRunner.run_all_tests(:pascal)
  # TestRunner.run_single_file(:pascal, 'animations')
  # TestRunner.run_specific_test(:pascal, 'animations', 'animation_count')
else
  if options[:language].nil?
    puts "Error: Language parameter is required"
    puts "Usage: ruby run_tests.rb --language LANGUAGE [--group GROUP] [--test TEST]"
    exit 1
  end

  begin
    if options[:test] && options[:group]
      TestRunner.run_specific_test(options[:language], options[:group], options[:test])
    elsif options[:group]
      TestRunner.run_single_file(options[:language], options[:group])
    else
      TestRunner.run_all_tests(options[:language])
    end
  rescue StandardError => e
    puts "Error: #{e.message}"
    exit 1
  end
end
