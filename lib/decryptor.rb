require_relative 'master_cipher'
require_relative 'offset'
require_relative 'rotation'

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
    MasterCipher.new(@encrypted_message, offset, rotation).decrypt
  end

end
