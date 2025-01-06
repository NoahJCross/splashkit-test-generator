require_relative 'lib'

# Module for executing tests across different programming languages
module TestRunner
  def self.run_all_tests(language)
    TestConfig.setup unless TestConfig.runners
    InstallationValidator.validate_language(language)
    runner = TestConfig.runners[language]
    MessageHandler.log_test("Starting all tests for #{language}")
    runner.run_tests(find_test_groups(language))
  rescue TestRunner::TestRunnerError => e
    MessageHandler.log_error("Test runner error: #{e.message}")
    raise
  rescue StandardError => e
    MessageHandler.log_error("Unexpected error running tests for #{language}: #{e.message}")
    raise
  end

  def self.run_specific_test(language, group, test_name)
    TestConfig.setup unless TestConfig.runners
    InstallationValidator.validate_language(language)
    runner = TestConfig.runners[language]
    MessageHandler.log_test("Starting test #{test_name} in #{group} for #{language}")
    runner.run_single_test(group, test_name)
  rescue TestRunner::TestRunnerError => e
    MessageHandler.log_error("Test runner error: #{e.message}")
    raise
  rescue StandardError => e
    MessageHandler.log_error("Unexpected error running specific test #{test_name} for #{language}: #{e.message}")
    raise
  end

  def self.run_single_file(language, file_name)
    TestConfig.setup unless TestConfig.runners
    InstallationValidator.validate_language(language)
    runner = TestConfig.runners[language]
    MessageHandler.log_test("Starting tests for #{file_name} in #{language}")
    runner.run_tests([file_name])
  rescue TestRunner::TestRunnerError => e
    MessageHandler.log_error("Test runner error: #{e.message}")
    raise
  rescue StandardError => e
    MessageHandler.log_error("Unexpected error running file #{file_name} for #{language}: #{e.message}")
    raise
  end

  def self.find_test_groups(language)
    test_files = Dir.glob("generated_tests/#{language}/tests/*_tests.*")
    test_files.map { |f| File.basename(f, '.*').gsub('_tests', '') }
  end
end
