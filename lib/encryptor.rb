require_relative 'rotation'
require_relative 'offset'
require "pry"

class Encryptor
  attr_accessor :string, :offset, :rotation, :char_map


  def initialize(string="atomic", offset=[1,1,1,1], rotation=[2,2,2,2])
    self.string = string.chars
    self.offset = offset
    self.rotation = rotation
  end

  def encrypt
    MasterCipher.new(string.join, offset, rotation).encrypt
  end
end
