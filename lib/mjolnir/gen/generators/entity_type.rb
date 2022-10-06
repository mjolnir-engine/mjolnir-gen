require_relative "base"

module Mjolnir
  module Gen
    module Generators
      class EntityType < Base
        source_root File.join(__dir__, "templates/entity_type")
        argument :name, type: :string, desc: "The name of the entity"

        def create_system_file
          template "entity_type.go.erb", File.join(full_target_directory, name, "#{name}_entity_type.go")
        end

        def create_system_test_file
          template "entity_type_test.go.erb", File.join(full_target_directory, name, "#{name}_entity_type_test.go")
        end

        private

        def target_directory
          "entities"
        end
      end
    end
  end
end
