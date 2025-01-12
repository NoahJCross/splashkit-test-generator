require_relative 'base_test_runner'

class PascalTestRunner < BaseTestRunner
  def run_sequential_group(group)
    group_name = group.to_pascal_case
    system("cd generated_tests/pascal && skm fpc -Fu'.' -Fu'tests' test_main.pas -o'test_main' && /lib64/ld-linux-x86-64.so.2 ./test_main --group=#{group_name}")
    puts "Running test in: #{Dir.pwd}/generated_tests/pascal"
  end

  def run_parallel_group(group)
    group_name = group.to_pascal_case
    output_name = "test_main_#{Process.pid}"
    system("cd generated_tests/pascal && skm fpc -Fu'.' -Fu'tests' test_main.pas -o#{output_name} && /lib64/ld-linux-x86-64.so.2 ./#{output_name} --group=#{group_name}")
  end

  def run_specific_test(group, test_method)
    group_name = group.to_pascal_case
    system("cd generated_tests/pascal && skm fpc -Fu'.' -Fu'tests' test_main.pas -o'test_main' && /lib64/ld-linux-x86-64.so.2 ./test_main --group=#{group_name} --test=#{test_method}")
  end

  def get_test_method_name(test_name)
    "Test#{test_name.to_pascal_case}Integration"
  end
end