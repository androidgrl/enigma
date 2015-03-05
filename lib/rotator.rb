require_relative 'rotation'
require_relative 'offset'

class Rotator
  attr_accessor :string, :offset, :rotation

  MAP = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]

  def initialize(string, offset, rotation)
    self.string = string
    self.offset = offset
    self.rotation = rotation
  end

  def find_letter_indices
    letters = self.string.chars
    indices = letters.map do |l|
      MAP.index(l)
    end
  end

  def total_shift_array
    self.offset.zip(self.rotation).map do |n, o|
      n + o
    end
  end

  def encrypt_strin

  end

end

rot = Rotator.new("cat", Offset.new.create_offset, Rotation.new.rotation_array)
#rot = Rotator.new("cat", 3, 4)
rot.total_shift_array
