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
end
