class Coffee
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
      @message = "You chose coffee as your pre-processor"
    end
    puts @message
  end
end
