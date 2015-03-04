class Offset
  attr_reader :date

  def initialize
    @date = Time.now.strftime("%M%D%Y")
  end
end
