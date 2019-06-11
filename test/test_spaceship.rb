# frozen_string_literal: true

# tests for spaceship class
class TestSpaceship < Minitest::Test
  def setup
    @spaceship = Spaceship.new
  end

  def test_shooting_method_returns_value_between_minus_125_and_125
    assert @spaceship.shoot(44.99) > -125
    assert @spaceship.shoot(44.99) < 125
    assert @spaceship.shoot(-44.99) > -125
    assert @spaceship.shoot(-44.99) < 125
  end

  def test_valid_angle_method
    assert_equal true, @spaceship.valid_angle?(0)
    assert_equal false, @spaceship.valid_angle?(45)
    assert_equal false, @spaceship.valid_angle?(-45)
    assert_equal true, @spaceship.valid_angle?(44.99)
    assert_equal true, @spaceship.valid_angle?(-44.99)
  end

  def test_spaceship_converts_angle_to_radians
    assert_equal 0, @spaceship.send(:convert_angle_to_radians, 0)
    assert_equal 2 * Math::PI, @spaceship.send(:convert_angle_to_radians, 360)
    assert_equal Math::PI, @spaceship.send(:convert_angle_to_radians, 180)
  end
end
