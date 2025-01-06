require_relative 'base_test_runner'

class RustTestRunner < BaseTestRunner
  def run_sequential_group(group)
    result = system("cd generated_tests/rust && cargo test --test #{group}_tests -- --test-threads=1 --nocapture")
    raise "Test failed: #{group}" unless result
  end

  def run_parallel_group(group)
    result = system("cd generated_tests/rust && cargo test --test #{group}_tests")
    raise "Test failed: #{group}" unless result
  end

  def run_specific_test(group, test_class, test_method)
    system("cd generated_tests/rust && cargo test --test #{group}_tests #{test_class}::#{test_method} -- --test-threads=1 --nocapture")
  end

  def get_test_method_name(test_name)
    "test_#{test_name}_integration"
  end
end
