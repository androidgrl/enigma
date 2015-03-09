class Thingy
  attr_accessor :offset, :rotation, :message, :char_map

  def initialize(message, offset, rotation)
    @message = message
    @offset = offset
    @rotation = rotation
    @char_map = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]
  end

  def decrypt
    total_shift = build_shift
    message_indices = build_message_indices

    decrypted_indices = message_indices.zip(total_shift).map do |index, shift|
      (index - shift) % 39
    end

    build_string(decrypted_indices)
  end

  def encrypt
    total_shift = build_shift
    message_indices = build_message_indices

    encrypted_indices = message_indices.zip(total_shift).map do |index, shift|
      begin
      (index + shift) % 39
    rescue
      binding.pry
    end
    end

    build_string(encrypted_indices)
  end

  private

  def build_string(indices)
    indices.map do |index|
      char_map[index]
    end.join
  end

  def build_message_indices
    message.chars.map do |letter|
      char_map.index(letter)
    end
  end

  def build_shift
    short_array = offset.zip(rotation).map do |offset,rotation|
      offset + rotation
    end

    total_array = short_array * (@message.length/short_array.length + 1)
    total_array.take(@message.length)
  end

#   def how_much_to_lengthen_the_total_shift_array
# -    self.string.length/self.total_shift_array.length + 1
# -  end
# -  def lengthen_the_total_shift_array
# -    self.total_shift_array * how_much_to_lengthen_the_total_shift_array
# -  end
# -
# -  def make_the_shift_array_the_same_length_as_message
# -    lengthen_the_total_shift_array.take(find_letter_indices.length)
# -  end

end
