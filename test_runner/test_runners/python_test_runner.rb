require_relative 'base_test_runner'

class PythonTestRunner < BaseTestRunner
  def run_sequential_group(group)
    system("python3 -s -m pytest generated_tests/python/tests/#{group}_tests.py -vv -l --tb=long --capture=no -p no:parallel")
  end

  def run_parallel_group(group)
    system("python3 -s -m pytest generated_tests/python/tests/#{group}_tests.py -vv -l --tb=long --capture=no")
  end

  def run_specific_test(group, test_method)
    system("python3 -s -m pytest generated_tests/python/tests/#{group}_tests.py::Test#{group.to_pascal_case}::#{test_method} -vv -l --tb=long --capture=no")
  end

  def get_test_method_name(test_name)
    "test_#{test_name}_integration"
  end
end
