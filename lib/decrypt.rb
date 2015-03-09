require_relative 'decryptor'
require_relative 'rotation'
require_relative 'offset'
require_relative 'master_cipher'

class FileParser
  attr_accessor :message

  def load(filename)
    File.readlines(filename).each do |line|
      self.message = line.to_s.chomp
    end
  end
end

file_parser = FileParser.new
path = File.join(__dir__, ARGV[0])
file_parser.load(path)

date = ARGV[2]
key = ARGV[1]
decryptor = Decryptor.new(file_parser.message, date, key)

decrypted_message = decryptor.decrypt
puts decrypted_message
