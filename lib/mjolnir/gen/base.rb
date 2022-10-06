require "thor"

require_relative "generators/system"
require_relative "generators/entity_type"
require_relative "generators/controller"
require_relative "generators/template"

module Mjolnir
  module Gen
    class Base < Thor
      include Thor::Actions
      desc "mjolnir-gen SUBCOMMAND", "Code generator for the Mjolnir MUD engine"

      desc "system NAME COMPONENT", "Generate a new system for the given name and component"
      def system(name, component)
        Mjolnir::Gen::Generators::System.start([name, component])
      end

      desc "entity_type NAME", "Generate a new entity type for the given name"
      def entity_type(name)
        Mjolnir::Gen::Generators::EntityType.start([name])
      end

      desc "controller NAME", "Generate a new controller for the given name"
      def controller(name)
        Mjolnir::Gen::Generators::Controller.start([name])
      end

      desc "template NAME", "Generate a new template for the given name"
      def template(name)
        Mjolnir::Gen::Generators::Template.start([name])
      end
    end
  end
end
