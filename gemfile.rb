module Umsizi
  module Gemfile
    def self.run(haml = nil, sass = nil, coffee = nil, guard = nil)
      if !File.exist?("Gemfile")
        content = self.gem(haml, sass, coffee, guard)
        self.write(content)
      end
    end
    private
    def self.gem(haml, sass, coffee, guard)
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
      if Gem.win_platform?
        content += "gem 'wdm'\n"
      end
      content
    end
    def self.write(content)
      output = File.new("Gemfile", "w")
      output.puts(content)
    end
  end
end
