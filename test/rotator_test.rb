require_relative 'test_helper'
require_relative '../lib/rotator'

class TestRotator < Minitest::Test
  def test_it_exists
    assert Rotator
  end

  def test_it_takes_in_a_string_and_splits_it
    rot = Rotator.new
    assert_equal ["a", "t", "o", "m", "i", "c"], rot.string
  end

  def test_it_has_an_offset_attribute_that_is_a_four_element_array
    rot = Rotator.new
    assert_equal [1, 1, 1, 1], rot.offset
    assert_equal 4, rot.offset.length
  end

  def test_it_has_a_rotation_attribute_that_is_a_four_element_array
    rot = Rotator.new
    assert_equal [2,2,2,2], rot.rotation
    assert_equal 4, rot.rotation.length
  end

  def test_it_can_have_a_new_offset
    rot = Rotator.new("blondie", [9,2,2,5])
    assert_equal [9,2,2,5], rot.offset
    assert_equal 4, rot.offset.length
  end

  def test_it_can_have_a_new_rotation
    rot = Rotator.new("blondie", [9,2,2,5], [8,0,0,8])
    assert_equal [8,0,0,8], rot.rotation
    assert_equal 4, rot.rotation.length
  end

  def test_it_can_find_letter_indices
    rot = Rotator.new
    assert_equal [0,19,14,12,8,2], rot.find_letter_indices
  end

  def test_it_can_add_offset_and_rotation_to_get_total_shift_array
    rot = Rotator.new
    assert_equal [3,3,3,3], rot.total_shift_array
  end

  def test_it_can_calculate_the_factor_to_elongate_the_total_shift_array
    rot = Rotator.new
    assert_equal 2, rot.factor_to_elongate_the_shift_array
  end

  def test_it_can_form_an_elongated_total_shift_array
    rot = Rotator.new
    assert_equal [3,3,3,3,3,3,3,3], rot.elongated_total_shift_array
  end

  def test_it_can_chop_the_elongated_total_shift_array_to_be_the_same_length_as_the_find_letter_indices_array

    rot = Rotator.new
    assert_equal rot.find_letter_indices.length, rot.chopped_elongated_total_shift_array.length
  end

  def test_it_can_find_the_new_encrypted_index
    rot = Rotator.new
    assert_equal [3,22,17,15,11,5], rot.find_encrypted_index
  end
end
