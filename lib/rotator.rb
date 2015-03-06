require_relative 'rotation'
require_relative 'offset'

class Rotator
  attr_accessor :string, :offset, :rotation

  MAP = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]

  def initialize(string="atomic", offset=[1,1,1,1], rotation=[2,2,2,2])
    self.string = string.chars
    self.offset = offset
    self.rotation = rotation
  end

  def find_letter_indices
    letters = self.string
    indices = letters.map do |l|
      MAP.index(l)
    end
  end

  def total_shift_array
    self.offset.zip(self.rotation).map do |n, o|
      n + o
    end
  end

  def factor_to_elongate_the_shift_array
    self.string.length/self.total_shift_array.length + 1
  end

  def elongated_total_shift_array
    self.total_shift_array * factor_to_elongate_the_shift_array
  end

  def

end

# rot = Rotator.new("catat", Offset.new.create_offset, Rotation.new.rotation_array)
# #rot = Rotator.new("catat", 3, 4)
# rot.elongated_total_shift_array
