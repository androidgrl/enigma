require_relative 'rotation'  # => true
require_relative 'offset'    # => true
require "pry"                # => true

class Rotator
  attr_accessor :string, :offset, :rotation  # => nil

  MAP = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  def initialize(string="atomic", offset=[1,1,1,1], rotation=[2,2,2,2])
    self.string = string.chars                                           # => ["c", "a", "t", "a", "t"]
    self.offset = offset                                                 # => [9, 2, 2, 5]
    self.rotation = rotation                                             # => [26, 68, 89, 92]
  end                                                                    # => nil

  def find_letter_indices
    letters = self.string         # => ["c", "a", "t", "a", "t"]
    indices = letters.map do |l|  # => ["c", "a", "t", "a", "t"]
      MAP.index(l)                # => 2, 0, 19, 0, 19
    end                           # => [2, 0, 19, 0, 19]
  end                             # => nil

  def total_shift_array
    self.offset.zip(self.rotation).map do |n, o|  # => [[9, 26], [2, 68], [2, 89], [5, 92]], [[9, 26], [2, 68], [2, 89], [5, 92]], [[9, 26], [2, 68], [2, 89], [5, 92]], [[9, 26], [2, 68], [2, 89], [5, 92]]
      n + o                                       # => 35, 70, 91, 97, 35, 70, 91, 97, 35, 70, 91, 97, 35, 70, 91, 97
    end                                           # => [35, 70, 91, 97], [35, 70, 91, 97], [35, 70, 91, 97], [35, 70, 91, 97]
  end                                             # => nil

  def factor_to_elongate_the_shift_array
    self.string.length/self.total_shift_array.length + 1  # => 2, 2
  end                                                     # => nil

  def elongated_total_shift_array
    self.total_shift_array * factor_to_elongate_the_shift_array  # => [35, 70, 91, 97, 35, 70, 91, 97], [35, 70, 91, 97, 35, 70, 91, 97]
  end                                                            # => nil

  def chopped_elongated_total_shift_array
    elongated_total_shift_array.take(find_letter_indices.length)  # => [35, 70, 91, 97, 35]
  end                                                             # => nil
end                                                               # => nil

rot = Rotator.new("catat", Offset.new.create_offset, Rotation.new.rotation_array)  # => #<Rotator:0x007fde9916be38 @string=["c", "a", "t", "a", "t"], @offset=[9, 2, 2, 5], @rotation=[26, 68, 89, 92]>
#rot = Rotator.new("catat", 3, 4)                                                   # => #<Rotator:0x007f8b0408c528 @string=["c", "a", "t", "a", "t"], @offset=3, @rotation=4>
rot.elongated_total_shift_array                                                    # => [35, 70, 91, 97, 35, 70, 91, 97]
rot.chopped_elongated_total_shift_array                                            # => [35, 70, 91, 97, 35]
