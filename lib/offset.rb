class Offset
  attr_reader :date

  def initialize(date=Time.now.strftime("%m%m%y"))
    @date = date
  end

  def integer_date
    date.to_i
  end

  def create_offset
    digits = (integer_date ** 2).to_s.chars
    digits[-4..-1].map{|d| d.to_i }
  end
end

off = Offset.new.create_offset
