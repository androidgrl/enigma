require_relative 'master_cipher'  # => true
require_relative 'offset'         # => true
require_relative 'rotation'       # => true

class Decryptor

  def initialize(encrypted_message, date, key)
    @encrypted_message = encrypted_message                   # => "7vm0w2mapvsx45m6p mfz3txv564l4m1m7m04os0pxt4", "fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab"
    @date = date                                             # => "020315", "020315"
    @key = key                                               # => "10098", "13444"
    @char_map = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end                                                        # => nil

  def decrypt
    offset = Offset.new(@date).create_offset                        # => [9, 2, 2, 5], [9, 2, 2, 5]
    rotation = Rotation.new(@key).create_rotation_array             # => [10, 0, 9, 98], [13, 34, 44, 44]
    MasterCipher.new(@encrypted_message, offset, rotation).decrypt  # => "otbbd0bo9th.l3bh98btg1i.c3vf52bc65bblmhb9vif", "who is even remotely close to figuring out how to set up the crack feature"
  end                                                               # => nil

end  # => nil

decryptor = Decryptor.new("7vm0w2mapvsx45m6p mfz3txv564l4m1m7m04os0pxt4", "020315", "10098")  # => #<Decryptor:0x007f9c13885c78 @encrypted_message="7vm0w2mapvsx45m6p mfz3txv564l4m1m7m04os0pxt4", @date="020315", @key="10098", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
decryptor.decrypt                                                                             # => "otbbd0bo9th.l3bh98btg1i.c3vf52bc65bblmhb9vif"

decryptor = Decryptor.new("fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", "020315", "13444")  # => #<Decryptor:0x007f9c13897e00 @encrypted_message="fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", @date="020315", @key="13444", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
decryptor.decrypt

decrypor = Decryptor.new("", "030915", "")
decryptor.decrypt                                                                                                        # => "who is even remotely close to figuring out how to set up the crack feature"
