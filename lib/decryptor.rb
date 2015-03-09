class Decryptor

  def initialize(encrypted_message, date, key)
    @encrypted_message = encrypted_message
    @date = date
    @key = key
    @char_map = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]
  end

  def decrypt
    offset = Offset.new(@date).create_offset
    rotation = Rotation.new(@key).create_rotation_array

    total_shift = offset.zip(rotation).map do |offset,rotation|
      offset + rotation
    end

    letters = @encrypted_message.chars
    indices = letters.map do |letter|
      @char_map.index(letter)
    end

    differences = indices.zip(total_shift).map do |index, shift|
      index - shift
    end

    decrypted_indices = differences.map do |difference|
      difference % 39
    end

    decrypted_letters = decrypted_indices.map do |index|
      @char_map[index]
    end

    decrypted_letters.join
  end


end
