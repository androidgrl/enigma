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
    puts @attempted_key - 1
  end

  def cracked?
    @cracked
  end
end

crack = Crack.new("holymof", "030915")
crack.crack
 
# ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
# Created 'cracked.txt' with the cracked key 82648 and date 030415
