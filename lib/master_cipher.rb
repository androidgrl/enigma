class MasterCipher
  attr_accessor :offset, :rotation, :message, :char_map

  def initialize(message, offset, rotation)
    @message = message
    @offset = offset
    @rotation = rotation
    @char_map = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]
  end

  def decrypt
    # total_shift = build_shift
    # message_indices = build_message_indices

    decrypted_indices = message_indices.zip(total_shift).map do |index, shift|
      (index - shift) % 39
    end

    build_string(decrypted_indices)
  end

  def encrypt
    # total_shift = build_shift
    # message_indices = build_message_indices

    encrypted_indices = message_indices.zip(total_shift).map do |index, shift|
      (index + shift) % 39
    end

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
    short_array = offset.zip(rotation).map do |offset,rotation|
      offset + rotation
    end

    long_array = short_array * (@message.length/short_array.length + 1)
    long_array.take(@message.length)
  end

end

# mc = MasterCipher.new("a", "2", "3")  # => #<MasterCipher:0x007fe17907c300 @message="a", @offset="2", @rotation="3", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
# puts mc.char_map                      # => nil
