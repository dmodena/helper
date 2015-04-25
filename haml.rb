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
        `md #{@input}`
      end
    end
    if @output
      if !File.directory?(@output)
        `md #{@output}`
      end
    end
  end
end
