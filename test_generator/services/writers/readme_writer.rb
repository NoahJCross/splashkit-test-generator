module TestGenerator
  # Class responsible for generating README documentation for test suites
  class ReadmeWriter
    def initialize(config)
      @config = config
    end

    # Writes the README file for a specific language
    # @param language_dir [String] The directory path where README will be created
    # @return [void]
    def write_to(language_dir)
      File.open("#{language_dir}/README.md", 'w') do |file|
        write_header(file)
        write_requirements(file)
        write_installation(file)
        write_running_tests(file)
      end
    end

    private

    # Writes the header section of the README
    # @param file [File] The file handle to write to
    # @return [void]
    def write_header(file)
      file.puts "# SplashKit Test Suite - #{@config.language.to_s.capitalize}\n\n"
      file.puts "This directory contains integration tests for the SplashKit SDK.\n\n"
    end

    # Writes the requirements section if runtime requirements exist
    # @param file [File] The file handle to write to
    # @return [void]
    def write_requirements(file)
      file.puts "## Requirements\n\n"
      file.puts "- #{@config.runtime_requirement}\n\n" if @config.runtime_requirement
    end

    # Writes the installation steps if they exist
    # @param file [File] The file handle to write to
    # @return [void]
    def write_installation(file)
      file.puts "## Installation\n\n"
      file.puts @config.installation_steps if @config.installation_steps
      file.puts "\n"
    end

    # Writes the test execution instructions
    # @param file [File] The file handle to write to
    # @return [void]
    def write_running_tests(file)
      file.puts "## Running Tests\n\n"
      file.puts 'To run the tests:\n\n'
      file.puts '```bash'
      file.puts @config.run_command if @config.run_command
      file.puts "```\n"
    end
  end
end
