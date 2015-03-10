require_relative 'decryptor'
require_relative 'master_cipher'

class Crack

  def initialize(encrypted_message, date)
    @cracked = false
    @attempted_key = 0
    @date = date
    @encrypted_message = encrypted_message
    #"holymof", "030915", "41445", "..end.."
  end

  def crack
    until cracked?
      #puts @attempted_key
      key = @attempted_key.to_s.rjust(5, "0")
      @offset = Offset.new(@date).create_offset
      @rotation = Rotation.new(key).create_rotation_array
      @cipher = MasterCipher.new(@encrypted_message, @offset, @rotation)
      if @cipher.decrypt[-7..-1] == "..end.."
        @cracked = true
      end
      @attempted_key += 1
    end
    @attempted_key - 1
  end

  def cracked?
    @cracked
  end

end
