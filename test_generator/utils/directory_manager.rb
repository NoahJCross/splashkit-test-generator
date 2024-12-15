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
      create_directories
      [@language_dir, @tests_dir]
    end

    private

    # Creates the necessary directories for test generation if they don't exist
    # @raise [StandardError] If directory creation fails
    def create_directories
      @language_dir = "generated_tests/#{@language}"
      @tests_dir = "#{@language_dir}/tests"
      FileUtils.mkdir_p(@tests_dir) unless Dir.exist?(@tests_dir)
    rescue StandardError => e
      MessageHandler.log_error('Error creating directories', e.message)
      raise
    end
  end
end
