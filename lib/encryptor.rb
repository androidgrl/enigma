require_relative 'rotation'
require_relative 'offset'
require "pry"

class Encryptor
  attr_accessor :string, :offset, :rotation, :char_map


  def initialize(string="atomic", offset=[1,1,1,1], rotation=[2,2,2,2])
    self.string = string.chars
    self.offset = offset
    self.rotation = rotation
    self.char_map = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]

  end

  def find_letter_indices
    letters = self.string
    indices = letters.map do |l|
    char_map.index(l)
    end
  end

  def total_shift_array
    self.offset.zip(self.rotation).map do |n, o|
      n + o
    end
  end

  def how_much_to_lengthen_the_total_shift_array
    self.string.length/self.total_shift_array.length + 1
  end

  def lengthen_the_total_shift_array
    self.total_shift_array * how_much_to_lengthen_the_total_shift_array
  end

  def make_the_shift_array_the_same_length_as_message
    lengthen_the_total_shift_array.take(find_letter_indices.length)
  end

  def find_encrypted_index
    totals = find_letter_indices.zip(make_the_shift_array_the_same_length_as_message).map do |index, shift|
      index + shift
    end
    totals.map do |total|
      total % 39
    end
  end

  def encrypt
    find_encrypted_index.map do |index|
      self.char_map[index]
    end.join
  end
end
