# Copyright (c) 2022 eightfivefour llc. All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
# documentation files (the "Software"), to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
# Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require_relative "base"

module Mjolnir
  module Gen
    module Generators
      class Template < Base
        source_root File.join(__dir__, "templates/template")
        argument :name, type: :string, desc: "The name of the template"

        def create_system_file
          template "template.go.erb", File.join(full_target_directory, "#{name}_template.go")
        end

        def create_system_test_file
          template "template_test.go.erb", File.join(full_target_directory,  "#{name}_template_test.go")
        end

        private

        def target_directory
          "templates"
        end

        def struct_name
          return @struct_name if @struct_name

          @struct_name = name.classify
          @struct_name[0] = @struct_name[0].downcase

          @struct_name
        end

        def template_name
          name.classify
        end
      end
    end
  end
end


