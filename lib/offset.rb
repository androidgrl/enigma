class Offset
  attr_accessor :date

  def initialize(date=Time.now.strftime("%m%d%y"))
    self.date = date
  end

  def integer_date
    self.date.to_i
  end

  def create_offset
    digits = (integer_date ** 2).to_s.chars
    digits[-4..-1].map{|d| d.to_i }
  end
end
