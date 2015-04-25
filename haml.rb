class Haml
  def initialize(option, input = nil, output = nil)
    @option = option
    @input = input
    @output = output

    if @input || @output
      folder
    end
  end

  def folder
    if @input
      if !File.directory?(@input)
        @inp = reverse_slash(@input)
        `md #{@inp}`
      end
    end
    if @output
      if !File.directory?(@output)
        @out = reverse_slash(@output)
        `md #{@out}`
      end
    end
  end

  private

  def reverse_slash(path)
    if path.include? "/"
      path["/"] = "\\"
    end
    path
  end

end
