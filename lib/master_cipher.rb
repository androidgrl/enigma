require "pry"

class MasterCipher
  attr_accessor :offset, :rotation, :message, :char_map

  def initialize(message, offset, rotation)
    @message = message
    @offset = offset
    @rotation = rotation
    @char_map = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]
  end

  def decrypt
    build_string(decrypted_indices)
  end

  def encrypt
    build_string(encrypted_indices)
  end

  private

  def build_string(indices)
    indices.map do |index|
      char_map[index]
    end.join
  end

  def message_indices
    message.chars.map do |letter|
      char_map.index(letter)
    end
  end

  def total_shift
    long_array = short_array * (@message.length/short_array.length + 1)
    long_array.take(@message.length)
  end

  def short_array
    #memoization
    @short_array ||= offset.zip(rotation).map do |offset,rotation|
      offset + rotation
    end
  end

  def decrypted_indices
    message_indices.zip(total_shift).map do |index, shift|
      (index - shift) % 39
    end
  end

  def encrypted_indices
    message_indices.zip(total_shift).map do |index, shift|
      (index + shift) % 39
    end
  end

end
