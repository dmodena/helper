module Umsizi
  module Tree
    def self.run(option, input = nil, output = nil)
      if input || output
        self.folder(input, output)
      end
    end
    def self.folder(input, output)
      if input
        if !File.directory?(input)
          inp = reverse_slash(input)
          `mkdir #{inp}`
        end
      end
      if output
        if !File.directory?(output)
          out = reverse_slash(output)
          `mkdir #{out}`
        end
      end
    end
    private
    def self.reverse_slash(path)
      if path.include? "/"
        path["/"] = "\\"
      end
      path
    end
  end
  module Gemfile
    def self.run(haml, sass, coffee, guard)
      if !File.exist?("Gemfile")
        output = File.new("Gemfile", "w")
        content = self.write(haml, sass, coffee, guard)
        output.puts(content)
      end
    end
    private
    def self.write(haml, sass, coffee, guard)
      content = "source 'https://rubygems.org'\n\n"
      if haml
        content += "gem 'haml'\n"
        if guard
          content += "gem 'guard-haml'\n"
        end
      end
      if sass
        content += "gem 'sass'\n"
        if guard
          content += "gem 'guard-sass'\n"
        end
      end
      if coffee
        content += "gem 'coffee-script'\n"
        if guard
          content += "gem 'guard-coffeescript'\n"
        end
      end
      content
    end
  end
end
