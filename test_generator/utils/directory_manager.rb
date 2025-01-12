module TestGenerator
  # Class responsible for managing test directory creation and cleanup
  class DirectoryManager
    def initialize(language)
      @language = language
    end

    # Sets up the directory structure for test generation
    # @param language [String] The programming language for the tests
    # @return [Array<String>] Array containing paths to language and tests directories
    def self.setup(language)
      new(language).setup
    end

    # Creates the directory structure and returns the paths
    # @return [Array<String>] Array containing paths to language and tests directories
    def setup
      create_base_directories
      create_language_directories
      [@language_dir, @tests_dir]
    end

    private

    def create_base_directories
      create_directory('generated_tests')
      create_directory('resources')
    end

    def create_language_directories
      @language_dir = "generated_tests/#{@language}"
      @tests_dir = "#{@language_dir}/tests"
      create_directory(@language_dir)
      create_directory(@tests_dir)
    end

    def create_directory(path)
      FileUtils.mkdir_p(path) unless Dir.exist?(path)
    rescue StandardError => e
      MessageHandler.log_error("Failed to create directory: #{path}", e.message)
      raise TestGeneratorError, "Directory creation failed: #{e.message}"
    end
  end
end
