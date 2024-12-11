# Represents a function in the SplashKit API
class Function
  attr_reader :name, :description, :parameters, :return_type,
              :return_description, :group, :suffix, :signature, :constructor_type,
              :constant_value, :unique_global_name

  def initialize(attributes = {})
    @name = attributes[:name]
    @unique_global_name = attributes[:unique_global_name]
    @description = attributes[:description]
    @parameters = attributes[:parameters]
    @return_type = attributes[:return_type]
    @constructor_type = attributes[:constructor_type] || 'function'
    @return_description = attributes[:return_description]
    @group = attributes[:group]
    @suffix = attributes[:suffix] ? "_#{attributes[:suffix]}" : ''
    @signature = attributes[:signature]
    @constant_value = attributes[:constant_value]
  end
end