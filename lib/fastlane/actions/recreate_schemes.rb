module Fastlane
  module Actions
    class RecreateSchemesAction < Action
      def self.run(params)
        require 'xcodeproj'

        Helper.log.info "Recreate schemes for project: #{params[:project]}"

        project = Xcodeproj::Project.open(params[:project])
        project.recreate_user_schemes
      end

      def self.description
        "Recreate not shared Xcode project schemes"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :project,
            env_name: "XCODE_PROJECT",
            description: "The Xcode project"
          )
        ]
      end

      def self.authors
        "jerolimov"
      end

      def self.is_supported?(platform)
        [:ios, :mac].include? platform
      end
    end
  end
end
