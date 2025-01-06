module TestRunner
  # Validates that required development tools are installed for each supported language
  class InstallationValidator
    def self.validate_language(language)
      validator_class = VALIDATORS[language] or
        raise TestRunner::LanguageError, "Unsupported language: #{language}"
      validator_class.new.validate
    end
  end

  # Base validator class that provides common validation functionality for all language validators
  class BaseValidator
    INSTALLATION_INSTRUCTIONS = {
      'cargo' => 'Install Rust from https://rustup.rs',
      'rustc' => 'Install Rust from https://rustup.rs',
      'python3' => 'Download Python from https://www.python.org/downloads',
      'pytest' => 'Install pytest using: pip install pytest',
      'fpc' => 'Install Free Pascal from https://www.freepascal.org/download.html',
      'g++' => 'Install g++ using your system package manager (sudo apt install g++, brew install gcc, etc.)',
      'dotnet' => 'Install .NET SDK from https://dotnet.microsoft.com/download',
      'catch2' => 'Install Catch2 using your package manager (sudo apt install catch2, brew install catch2)'
    }.freeze

    def validate
      missing = required_tools.reject { |cmd| command_exists?(cmd) }
      unless missing.empty?
        instructions = missing.map do |tool|
          "\n- #{tool}: #{INSTALLATION_INSTRUCTIONS[tool] || 'No installation instructions available'}"
        end
        raise TestRunner::ConfigurationError, "Missing required tools: #{instructions.join}"
      end

      true
    end

    private

    def command_exists?(cmd)
      case platform
      when :windows
        system("where #{cmd} > NUL 2>&1")
      when :wsl, :unix
        system("which #{cmd} > /dev/null 2>&1")
      end
    end

    def platform
      @platform ||= detect_platform
    end

    def detect_platform
      return :windows if RUBY_PLATFORM =~ /mswin|mingw|cygwin/
      return :wsl if wsl?

      :unix
    end

    def wsl?
      @wsl ||= system('uname -r | grep -q "WSL"')
    end

    def required_tools
      raise NotImplementedError
    end
  end

  # Validates installation requirements for Rust development tools
  class RustValidator < BaseValidator
    private

    def required_tools
      %w[cargo rustc]
    end
  end

  # Validates installation requirements for Python development tools
  class PythonValidator < BaseValidator
    private

    def required_tools
      %w[python3 pytest]
    end
  end

  # Validates installation requirements for Pascal development tools
  class PascalValidator < BaseValidator
    private

    def required_tools
      %w[fpc]
    end
  end

  # Validates installation requirements for C++ development tools
  class CppValidator < BaseValidator
    def validate
      super
      check_catch2_headers
    end

    private

    def required_tools
      %w[g++]
    end

    def check_catch2_headers
      catch2_paths = [
        '/usr/include/catch2/catch_all.hpp',
        '/usr/local/include/catch2/catch_all.hpp'
      ]

      return if catch2_paths.any? { |path| File.exist?(path) }

      raise TestRunner::ConfigurationError,
            'Catch2 headers not found. Install using: sudo apt install catch2'
    end
  end

  # Validates installation requirements for C# development tools
  class CSharpValidator < BaseValidator
    private

    def required_tools
      %w[dotnet]
    end
  end

  # Move VALIDATORS to the end of the file, after all classes are defined
  InstallationValidator::VALIDATORS = {
    rust: RustValidator,
    python: PythonValidator,
    pascal: PascalValidator,
    cpp: CppValidator,
    csharp: CSharpValidator
  }.freeze
end
