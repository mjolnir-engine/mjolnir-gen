require_relative "base"

module Mjolnir
  module Gen
    module Generators
      class Template < Base
        source_root File.join(__dir__, "templates/template")
        argument :name, type: :string, desc: "The name of the controller"

        def create_system_file
          template "controller.go.erb", File.join(full_target_directory, "#{name}_template.go")
        end

        def create_system_test_file
          template "controller_test.go.erb", File.join(full_target_directory,  "#{name}_template_test.go")
        end

        private

        def target_directory
          "templates"
        end
      end
    end
  end
end


