require_relative 'test_helper'
require_relative '../lib/cracker'

class TestCrack < Minitest::Test
  def test_it_exists
    assert Crack
  end

  def assert_it_cracks(encrypted_message, date, key)
    returned_value = Crack.new(encrypted_message, date).crack
    assert_equal key, returned_value
  end

  def test_it_returns_a_cracked_key
    assert_it_cracks("holymof", "030915", 41445)

    assert_it_cracks("nhqouafjglsbehsgeb", "031015", 84037)
  
  end
end
