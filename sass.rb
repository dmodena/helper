class Sass
    def initialize(option, input = nil, output = nil)
      @option = option
      @input = input
      @output = output
      @message = ""

      if @input
        if @output
          @message = "Input: #{@input}, Output: #{@output}"
        else
          @message = "Input: #{@input}"
        end
      elsif @output
        @message = "Output: #{@output}"
      else
        @message = "You chose sass as your stylesheet"
      end
      puts @message
    end
end
