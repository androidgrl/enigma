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

# dec = Decryptor.new("199be66rd89oezakwe5oz5ap3", "090315", "66265")  # => #<Decryptor:0x007ff5d2885e08 @encrypted_message="199be66rd89oezakwe5oz5ap3", @date="090315", @key="66265", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
# dec.decrypt                                                          # => "4khjhhezgjhwhalszsdw2glx6"
#
# #dec = Decryptor.new("wm7uane,dcegfw3var3uvf5gcc2qqywvhq ,dskqqjwcetgvanf,rww0rzwylq ,if1gax3tltguahapvjcwhs1gvdw0rzwylq ,kfhgaya,dyfgqiwvxw7pjc4quct,pt,vkx", )
#
# dec = Decryptor.new("fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", "020315", "13444")  # => #<Decryptor:0x007ff5d288c6e0 @encrypted_message="fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", @date="020315", @key="13444", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
# dec.decrypt                                                                                                           # => "who is even remotely close to figuring out how to set up the crack feature"
