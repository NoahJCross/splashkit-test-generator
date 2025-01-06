require_relative '../lib'

module TestConfig
  def self.setup
    config = TestRunnerConfig.new

    # Sequential test groups
    config.mark_as_sequential('audio')
    config.mark_as_sequential('animations')
    config.mark_as_skip('audio')
    config.mark_as_skip('networking')
    config.mark_as_sequential('windows')
    config.mark_as_sequential('utilities')
    config.mark_as_skip('camera')
    config.mark_as_skip('graphics')
    config.mark_as_skip('geometry')
    config.mark_as_sequential('sprites')
    config.mark_as_skip('physics')
    config.mark_as_skip('resource_bundles')
    config.mark_as_sequential('resources')
    config.mark_as_sequential('timers')
    config.mark_as_skip('json')

    # Manual test groups
    config.mark_as_skip('input')
    config.mark_as_skip('interface')
    config.mark_as_skip('terminal')
    config.mark_as_skip('logging')
    config.mark_as_manual('input')
    config.mark_as_manual('interface')
    config.mark_as_manual('terminal')
    config.mark_as_manual('logging')

    @runners = {
      cpp: CppTestRunner.new(config),
      python: PythonTestRunner.new(config),
      pascal: PascalTestRunner.new(config),
      rust: RustTestRunner.new(config),
      csharp: CSharpTestRunner.new(config)
    }
  end

  def self.runners
    @runners
  end
end
