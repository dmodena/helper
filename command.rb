require 'optparse'
load 'version.rb'

options = {}
OptionParser.new do |opts|

  opts.banner = "Usage: umsizi.rb [options]"

  options[:haml] = false
  opts.on("--haml", "Choose Haml as template") do
    options[:haml] = true
  end

  options[:sass] = false
  opts.on("--sass", "Choose Sass as stylesheet") do
    options[:sass] = true
  end

  options[:coffee] = false
  opts.on("--coffee", "Choose CoffeeScript as pre-compiler") do
    options[:coffee] = true
  end

  opts.on("-v", "--version", "Show version") do
    puts "Umsizi #{VERSION}"
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
  end
end.parse!

p options
p ARGV
