module Umsizi
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
