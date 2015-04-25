class Guard
  def initialize(option, haml = nil, sass = nil, coffee = nil)
    @option = option
    @haml = haml
    @sass = sass
    @coffee = coffee
    @message = "Guard is automating: "

    if @haml
      @message += "haml "
    end
    if @sass
      @message += "sass "
    end
    if @coffee
      @message += "coffee "
    end

    puts @message
  end
end
