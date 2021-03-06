class Rotation
  attr_accessor :key, :rotation_array

  NUMBERS = [*"0".."9"]

  def initialize(key=nil)
    if key.nil?
      create_key
    else
      self.key = key
    end
    create_rotation_array
  end

  def create_key
    self.key = 5.times.map { NUMBERS.sample }
  end

  def create_rotation_array
    self.rotation_array = []

    i = 0
    while i < (key.length - 1)
      self.rotation_array << (key[i] + key[i+1])
      i += 1
    end

    self.rotation_array = self.rotation_array.map(&:to_i)
  end
end
