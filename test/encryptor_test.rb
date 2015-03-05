


Enigma.encrypt(
  Date.new.strftime(""),
  File.read("message.txt")
)
assert_equal "skjlsdlk", Enigma.encrypt("010188", "abc")
assert_equal "skjlsdlk", Enigma.encrypt("010198", "abc")
assert_equal "skjlsdlk", Enigma.encrypt("010188", "aCc")
assert_equal "skjlsdlk", Enigma.encrypt("010188", "abcasdf")
assert_equal "skjlsdlk", Enigma.encrypt("010188", "")


require 'text'

class FileReader
  def initialize(filename)
    File.read(filename)
  end
end
