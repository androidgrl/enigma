require_relative 'test_helper'
require_relative '../lib/encryptor'

class TestEncryptor < Minitest::Test
  def test_it_exists
    assert Encryptor
  end

  def test_it_takes_in_a_string_and_splits_it
    enc = Encryptor.new
    assert_equal ["a", "t", "o", "m", "i", "c"], enc.string
  end

  def test_it_has_an_offset_attribute_that_is_a_four_element_array
    enc = Encryptor.new
    assert_equal [1, 1, 1, 1], enc.offset
    assert_equal 4, enc.offset.length
  end

  def test_it_has_a_rotation_attribute_that_is_a_four_element_array
    enc = Encryptor.new
    assert_equal [2,2,2,2], enc.rotation
    assert_equal 4, enc.rotation.length
  end

  def test_it_can_have_a_new_offset
    enc = Encryptor.new("blondie", [9,2,2,5])
    assert_equal [9,2,2,5], enc.offset
    assert_equal 4, enc.offset.length
  end

  def test_it_can_have_a_new_rotation
    enc = Encryptor.new("blondie", [9,2,2,5], [8,0,0,8])
    assert_equal [8,0,0,8], enc.rotation
    assert_equal 4, enc.rotation.length
  end

  def test_it_can_find_letter_indices
    enc = Encryptor.new
    assert_equal [0,19,14,12,8,2], enc.find_letter_indices
  end

  def test_it_can_add_offset_and_rotation_to_get_total_shift_array
    enc = Encryptor.new
    assert_equal [3,3,3,3], enc.total_shift_array
  end

  def test_it_can_calculate_how_much_to_lengthen_the_total_shift_array
    enc = Encryptor.new
    assert_equal 2, enc.how_much_to_lengthen_the_total_shift_array
  end

  def test_it_can_lengthen_the_total_shift_array
    enc = Encryptor.new
    assert_equal [3,3,3,3,3,3,3,3], enc.lengthen_the_total_shift_array
  end

  def test_it_can_make_the_shift_array_the_same_length_as_message

    enc = Encryptor.new
    assert_equal enc.find_letter_indices.length, enc.make_the_shift_array_the_same_length_as_message.length
  end

  def test_it_can_find_the_new_encrypted_index
    enc = Encryptor.new
    assert_equal [3,22,17,15,11,5], enc.find_encrypted_index
  end

  def test_it_can_find_the_new_encrypted_te_for_non_default_parameters
    enc = Encryptor.new("ruby", [9,2,2,5], [41,15,52,21])
    assert_equal "2.ql", enc.encrypt
    assert enc.encrypt.length == enc.find_encrypted_index.length
  end
end
