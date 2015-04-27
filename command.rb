require 'optparse'
require_relative 'structure'
require_relative 'gemfile'
require_relative 'guardfile'
load 'version.rb'

options = {}
OptionParser.new do |opts|

  opts.banner = "Usage: ruby umsizi.rb [options]"

  options[:haml] = false
  options[:haml_input] = nil
  options[:haml_output] = nil
  opts.on("--haml", "Choose Haml as template") do
    options[:haml] = true
    if options[:haml]
      opts.on("-i", "--input i", String, "Input folder") do |i|
        options[:haml_input] = i
      end
      opts.on("-o", "--output o", String, "Output folder") do |o|
        options[:haml_output] = o
      end
    end
  end

  options[:sass] = false
  opts.on("--sass", "Choose Sass as stylesheet") do
    options[:sass] = true
    if options[:sass]
      opts.on("-i", "--input i", String, "Input folder") do |i|
        options[:sass_input] = i
      end
      opts.on("-o", "--output o", String, "Output folder") do |o|
        options[:sass_output] = o
      end
    end
  end

  options[:coffee] = false
  opts.on("--coffee", "Choose CoffeeScript as pre-compiler") do
    options[:coffee] = true
    if options[:coffee]
      opts.on("-i", "--input i", String, "Input folder") do |i|
        options[:coffee_input] = i
      end
      opts.on("-o", "--output o", String, "Output folder") do |o|
        options[:coffee_output] = o
      end
    end
  end

  options[:guard] = false
  opts.on("-g", "--guard", "Create guard automation") do
    options[:guard] = true
  end

  opts.on("-v", "--version", "Show version") do
    puts "Umsizi #{VERSION}"
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
  end
end.parse!

if options[:haml]
  Umsizi::Structure::run(options[:haml], options[:haml_input], options[:haml_output])
end
if options[:sass]
  Umsizi::Structure::run(options[:sass], options[:sass_input], options[:sass_output])
end
if options[:coffee]
  Umsizi::Structure::run(options[:coffee], options[:coffee_input], options[:coffee_output])
end

if options[:haml] || options[:sass] || options[:coffee]
  Umsizi::Gemfile::run(options[:haml], options[:sass], options[:coffee], options[:guard])
end

if options[:guard]
  Umsizi::Guardfile::run(options[:haml_input], options[:haml_output], options[:sass_input], options[:sass_output], options[:coffee_input], options[:coffee_output])
end
