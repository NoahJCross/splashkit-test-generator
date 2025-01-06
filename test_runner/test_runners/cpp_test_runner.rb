require_relative 'base_test_runner'

class CppTestRunner < BaseTestRunner
  def run_sequential_group(group)
    system("cd generated_tests/cpp && g++ -std=c++17 -I/usr/include test_main.cpp tests/#{group}_tests.cpp -l SplashKit -l Catch2 -o test && ./test")
  end

  def run_parallel_group(group)
    system("cd generated_tests/cpp && g++ -std=c++17 -I/usr/include test_main.cpp tests/#{group}_tests.cpp -l SplashKit -l Catch2 -o test && ./test")
  end

  def run_specific_test(group, test_method)
    system("cd generated_tests/cpp && g++ -std=c++17 -I/usr/include test_main.cpp tests/#{group}_tests.cpp -l SplashKit -l Catch2 -o test && ./test \"#{test_method}\"")
  end

  def get_test_method_name(test_name)
    "test_#{test_name}_integration"
  end
end
