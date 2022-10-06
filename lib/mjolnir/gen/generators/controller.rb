require_relative "base"

module Mjolnir
  module Gen
    module Generators
      class Controller < Base
        source_root File.join(__dir__, "templates/controller")
        argument :name, type: :string, desc: "The name of the controller"

        def create_system_file
          template "controller.go.erb", File.join(full_target_directory, name, "#{name}_controller.go")
        end

        def create_system_test_file
          template "controller_test.go.erb", File.join(full_target_directory, name, "#{name}_controller_test.go")
        end

        private

        def target_directory
          "controllers"
        end
      end
    end
  end
end

