#!/usr/bin/ruby

class PluginConfig
  attr_reader :loco
  
  def initialize(options: {})
    @loco = Loco.new(options: options["loco"] || {})

    puts self.to_s
  end

  def to_s
    return "" "
      loco: #{loco.to_s}
      " ""
  end
end

class Loco
  attr_reader :create_pr
  attr_reader :config_file
  attr_reader :input_directory
  attr_reader :output_directory
  attr_reader :string_keys_file

  def initialize(options: {})
    @create_pr = options.key?("create_pr") ? options["create_pr"] : false
    @config_file = options["config_file"]
    @input_directory = options["input_directory"]
    @output_directory = options["output_directory"]
    @string_keys_file = options["string_keys_file"]
  end

  def to_s
    return "" "
      create_pr: #{create_pr}
      config_file: #{config_file}
      input_directory: #{input_directory}
      output_directory: #{output_directory}
      string_keys_file: #{string_keys_file}
      " ""
  end
end
