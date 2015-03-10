require_relative 'master_cipher'  # => true
require_relative 'offset'         # => true
require_relative 'rotation'       # => true

class Decryptor

  def initialize(encrypted_message, date, key)
    @encrypted_message = encrypted_message                   # => "qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168"
    @date = date                                             # => "030915"
    @key = key                                               # => "29187"
    @char_map = [*"a".."z"] + [*"0".."9"] + [" ", ".", ","]  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end                                                        # => nil

  def decrypt
    offset = Offset.new(@date).create_offset                        # => [7, 2, 2, 5]
    rotation = Rotation.new(@key).create_rotation_array             # => [29, 91, 18, 87]
    MasterCipher.new(@encrypted_message, offset, rotation).decrypt  # => "this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months."
  end                                                               # => nil

end  # => nil

# dec = Decryptor.new("199be66rd89oezakwe5oz5ap3", "090315", "66265")  # => #<Decryptor:0x007ff5d2885e08 @encrypted_message="199be66rd89oezakwe5oz5ap3", @date="090315", @key="66265", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
# dec.decrypt                                                          # => "4khjhhezgjhwhalszsdw2glx6"
#
# #dec = Decryptor.new("wm7uane,dcegfw3var3uvf5gcc2qqywvhq ,dskqqjwcetgvanf,rww0rzwylq ,if1gax3tltguahapvjcwhs1gvdw0rzwylq ,kfhgaya,dyfgqiwvxw7pjc4quct,pt,vkx", )
#
# dec = Decryptor.new("fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", "020315", "13444")  # => #<Decryptor:0x007ff5d288c6e0 @encrypted_message="fevh4peoebuhabtycbs8t,sybbe3 7ms2rys9deydqer te3 7zoc71ztqoot,ykyhep0 04ab", @date="020315", @key="13444", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
# dec.decrypt
#
# dec = Decryptor.new("qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168", "030915", "29187")  # => #<Decryptor:0x007fe1b584aed8 @encrypted_message="qw267x,l m,s,6y771y6pp0s9mx2728778yzimu1v37s7pv2r8rwqnrwcmf2rmx27a887.2zimzo,tr6b622r7rql2,sn9y1,t,m7a887.2zim1ostr7lmu7qt7r78b5f20lc3.l4m62k8168", @date="030915", @key="29187", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
# dec.decrypt                                                                                                                                                                                  # => "this is a secret message, do not tell anyone about it. if you do you will face serious consequences. you will have to attend turing for 7 months."
