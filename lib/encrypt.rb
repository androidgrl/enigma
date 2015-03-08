require_relative 'rotator'
require_relative 'rotation'
require_relative 'offset'
require 'pry'

class FileParser
  attr_accessor :message

  def load(filename)
    File.readlines(filename).each do |line|
      self.message = line.to_s.chomp
    end
  end
end

fp = FileParser.new
path = File.join(__dir__, ARGV[0])
fp.load(path)

class Encryptor
  attr_accessor :rotator

  def initialize(rotator)
    @rotator = rotator
  end

  def encrypt
    "#{@rotator.encrypt}"
  end
end

rotator = Rotator.new(fp.message, Offset.new.create_offset, Rotation.new.rotation_array)
encr = Encryptor.new(rotator)
encrypted_message = encr.encrypt
puts encrypted_message

class FileWriter
  def save(filename, encrypted_message)
    File.open(filename, "w") do |file|
      file.puts "#{encrypted_message}"
    end
  end
end

fw = FileWriter.new
saved_file = File.join(__dir__, ARGV[1])
fw.save(saved_file, encrypted_message)
