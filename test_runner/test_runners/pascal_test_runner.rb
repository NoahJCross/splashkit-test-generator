require_relative 'base_test_runner'

class PascalTestRunner < BaseTestRunner
  def run_sequential_group(group)
    group_name = group.to_pascal_case
    system("fpc #{group_name}_tests.pas && ./#{group_name}_tests")
  end

  def run_parallel_group(group)
    group_name = group.to_pascal_case
    system("fpc #{group}_tests.pas -o#{group_name}_tests_#{Process.pid} && ./#{group_name}_tests_#{Process.pid}")
  end

  def run_specific_test(group, test_method)
    group_name = group.to_pascal_case
    system("fpc #{group}_tests.pas && ./#{group_name}_tests --test=#{test_method}")
  end

  def get_test_method_name(test_name)
    "Test#{test_name.to_pascal_case}Integration"
  end
end
