require_relative 'base_test_runner'

class PythonTestRunner < BaseTestRunner
  def run_sequential_group(group)
    system("python3 #{group}_tests.py")
  end

  def run_parallel_group(group)
    system("python3 #{group}_tests.py")
  end

  def run_specific_test(group, _, test_method)
    system("cd generated_tests/python/tests && python3 -m pytest #{group}_tests.py -v -k #{test_method}")
  end

  def get_test_method_name(test_name)
    "test_#{test_name}_integration"
  end
end
