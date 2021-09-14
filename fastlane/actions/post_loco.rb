require "fastlane/action"
require "fileutils"
require "json"

module Fastlane
  module Actions
    class PostLocoAction < Action
      def self.run(params)
        UI.important("Execute actions after Loco export")

        input_directory = params[:input_directory]
        output_directory = params[:output_directory]
        string_keys_file = params[:string_keys_file]

        # Generate the asset loader
        sh("fvm flutter pub run easy_localization:generate -S #{input_directory} -O #{output_directory}")

        # Generate the locale keys
        sh("fvm flutter pub run easy_localization:generate -S #{input_directory} -f keys -o #{string_keys_file} -O #{output_directory}")
      end

      def self.description
        "Executes actions after Loco export"
      end

      def self.authors
        ["Yves Delcoigne", "Bram De Coninck"]
      end

      def self.return_value
      end

      def self.details
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :input_directory,
                                       env_name: "FL_POST_LOCO_INPUT_DIR",
                                       description: "Path to directory with files from Loco",
                                       is_string: true,
                                       default_value: ""),
          FastlaneCore::ConfigItem.new(key: :output_directory,
                                       env_name: "FL_POST_LOCO_OUTPUT_DIR",
                                       description: "Path to output directory of Loco results",
                                       is_string: true,
                                       default_value: ""),
          FastlaneCore::ConfigItem.new(key: :string_keys_file,
                                       env_name: "FL_POST_LOCO_STRING_KEYS_FILE",
                                       description: "Name of file with all localization keys",
                                       is_string: true,
                                       default_value: ""),
        ]
      end

      def self.is_supported?(platform)
        [:flutter].include?(platform)
      end
    end
  end
end
