require_relative 'test_helper'
require_relative '../lib/cracker'

class TestCrack < Minitest::Test
  def test_it_exists
    assert Crack
  end

  def test_it_returns_a_cracked_key
    crack = Crack.new("holymof", "030915")
    assert_equal 41445, crack.crack
  end

  def assert_it_cracks
    
  end
end
