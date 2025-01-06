require_relative '../lib'

class BaseTestRunner
  def initialize(config)
    @config = config
    @language = self.class.name.downcase.sub('testrunner', '')
  end

  def run_tests(groups)
    sequential_tests = []
    parallel_tests = []

    groups.each do |group|
      next if @config.should_skip?(group)
      next unless CapabilityValidator.validate_group(group)

      if @config.is_sequential?(group)
        sequential_tests << group
      else
        parallel_tests << group
      end
    end

    # Run sequential tests
    run_sequential_tests(sequential_tests) unless sequential_tests.empty?

    # Run parallel tests
    run_parallel_tests(parallel_tests) unless parallel_tests.empty?
  end

  def run_single_test(group, test_name)
    test_method = get_test_method_name(test_name)
    test_files = Dir.glob("generated_tests/#{@language}/tests/*_tests.*")
    test_file = test_files.find { |f| File.read(f).include?(test_method) }
    raise "No test found for function #{test_name}" unless test_file

    MessageHandler.log_test("Running specific test: #{group}##{test_method}")
    run_specific_test(group, test_method)
  end

  protected

  def run_sequential_tests(groups)
    groups.each do |group|
      next if @config.is_manual?(group) && !Prompt.confirm_manual_test(group)

      MessageHandler.log_test("Running sequential test: #{group}")
      run_sequential_group(group)
    end
  end

  def run_parallel_tests(groups)
    groups.each do |group|
      next if @config.is_manual?(group) && !Prompt.confirm_manual_test(group)

      MessageHandler.log_test("Running parallel test: #{group}")
      run_parallel_group(group)
    end
  end

  def run_sequential_group(group)
    raise NotImplementedError
  end

  def run_parallel_group(group)
    raise NotImplementedError
  end

  def run_specific_test(group, test_method)
    raise NotImplementedError
  end

  def get_test_method_name(test_name)
    raise NotImplementedError
  end
end
