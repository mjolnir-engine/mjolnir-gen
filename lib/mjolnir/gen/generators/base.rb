require "thor/group"
require "thor/actions"
require "active_support/core_ext/string/inflections"

module Mjolnir
  module Gen
    module Generators
      class Base < Thor::Group
        include Thor::Actions

        private

        def var_name
          @var_name ||= name.classify
        end

        def full_target_directory
          File.join(Dir.pwd, target_directory)
        end

        def target_directory
          raise NotImplementedError
        end
      end
    end
  end
end