require_relative 'test_helper'
require_relative '../lib/decryptor'

class TestDecryptor < Minitest::Test
  def test_it_exists
    assert Decryptor
  end

  def test_it_decrypts_a_string
    decryptor = Decryptor.new("2.ql", "030315", "41521")
    assert_equal "ruby", decryptor.decrypt
    decryptor = Decryptor.new("nr8", "030315", "41521")
    assert_equal "cat", decryptor.decrypt
    decryptor = Decryptor.new("8p6,z03dpka30fbfm46em4h,smk49t3f3fpa6s3ix1awawnxnmg2ng", "030815", "50698")
    assert_equal "thanks rachel it was wonderful to work with you..end..", decryptor.decrypt
    # (take-in the name of the encrypted text file and the name of the decrypted text file,)
    # take-in the string, date, and the key of the original encryption
    # find the offset and the rotation from the date and key, add them,
    # subract the total from the
  end


end
