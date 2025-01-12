# Validates hardware capabilities
class CapabilityValidator
  GPIO_GROUPS = %w[raspberry].freeze
  GPIO_PATHS = %w[/dev/gpiomem /dev/gpio /sys/class/gpio].freeze

  def self.validate_group(group)
    return true unless GPIO_GROUPS.include?(group)

    unless gpio_available?
      puts "\nSkipping '#{group}' - GPIO capability not detected"
      return false
    end

    true
  end

  def self.gpio_available?
    GPIO_PATHS.any? { |path| File.exist?(path) }
  end
end
