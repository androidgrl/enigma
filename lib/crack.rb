require_relative 'cracker'
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
crack = Crack.new(file_parser.message, date)
key = crack.crack.to_s
decryptor = Decryptor.new(file_parser.message, date, key)
decrypted_message = decryptor.decrypt

class FileWriter
  def save(filename, decrypted_message)
    File.open(filename, "w") do |file|
      file.puts "#{decrypted_message}"
    end
  end
end

file_writer = FileWriter.new
saved_file = File.join(__dir__, ARGV[1])
file_writer.save(saved_file, decrypted_message)
puts "Created #{ARGV[1]} with the cracked key #{key} and date #{date}"

# ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
# Created 'cracked.txt' with the cracked key 82648 and date 030415
