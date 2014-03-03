# assuming that your solution is polynomial.rb
require 'test/unit'
require_relative 'polynomial'
 
class PolynomialTest < Test::Unit::TestCase
  def test_first_negative
    assert_poly("-3x^4-4x^3+x^2+6", -3, -4, 1, 0, 6) 
  end
 
  def test_simple
    assert_poly("x^2+2", 1, 0, 2) 
  end
 
  def test_first_minus_one
    assert_poly("-x^3-2x^2+3x", -1, -2, 3, 0)
  end
 
  def test_all_zero
    assert_poly("0", 0, 0, 0)
  end
 
  def test_last_one
    assert_poly("x-1", 1, -1)
  end
 
  def test_error
    e = assert_raise(ArgumentError) { Polynomial.new([1]) }
    assert_match(/Need at least 2 coefficients/, e.message)
  end
  
  def assert_poly(result, *c)
    assert_equal(result, Polynomial.new(c).to_s)
  end
end
 

