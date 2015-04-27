module Umsizi
  module Guardfile
    def self.run(haml_input = nil, haml_output = nil, sass_input = nil, sass_output = nil, coffee_input = nil, coffee_output = nil)
      if !File.exist?("Guardfile")
        content = ""
        if haml_input || haml_output
          content += self.haml(haml_input, haml_output)
        end
        if sass_input || sass_output
          content += self.sass(sass_input, sass_output)
        end
        if coffee_input || coffee_output
          content += self.coffee(coffee_input, coffee_output)
        end
        self.write(content)
      end
    end
    private
    def self.haml(haml_input, haml_output)
      unless haml_input
        haml_input = "."
      end
      unless haml_output
        haml_output = "."
      end
      content = "guard :haml, input: '#{haml_input}', output: '#{haml_output}', run_at_start: true do\n  watch %r{^#{haml_input}/.+(\\.html\\.haml)}\nend\n\n"
      content
    end
    def self.sass(sass_input, sass_output)
      unless sass_input
        sass_input = "."
      end
      unless sass_output
        sass_output = "."
      end
      content = "guard 'sass', :input => '#{sass_input}', :output => '#{sass_output}', :all_on_start => true do\n  watch %r{^#{sass_input}/.+(\\.s[ac]ss)$}\nend\n\n"
      content
    end
    def self.coffee(coffee_input, coffee_output)
      unless coffee_input
        coffee_input = "."
      end
      unless coffee_output
        coffee_output = "."
      end
      content = "coffeescript_options = {\n  input: '#{coffee_input}',\n  output: '#{coffee_output}',\n  all_on_start: true,\n  patterns: [%r{^coffee/(.+\.(?:coffee|coffee\.md|litcoffee))$}]\n}\nguard 'coffeescript', coffeescript_options do\n  coffeescript_options[:patterns].each { |pattern| watch(pattern) }\nend\n\n"
      content
    end
    def self.write(content)
      output = File.new("Guardfile", "w")
      output.puts(content)
    end
  end
end
