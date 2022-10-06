require_relative "base"

module Mjolnir
  module Gen
    module Generators
      class System < Base
        source_root File.join(__dir__, "templates/system")

        argument :name, type: :string, desc: "The name of the system"
        argument :component, type: :string, desc: "The component the system is for"

        def create_system_file
          template "system.go.erb", File.join(full_target_directory, name, "#{name}_system.go")
        end

        def create_system_test_file
          template "system_test.go.erb", File.join(full_target_directory, name, "#{name}_system_test.go")
        end

        private

        def target_directory
          "systems"
        end
      end
    end
  end
end
