# Tests for Alien class
class TestAlien < Minitest::Test
  def setup
    @alien = Alien.new(5)
  end

  def test_alien_is_alive_when_created
    assert_equal true, @alien.alive?
  end

  def test_kill_changes_status_to_dead
    @alien.kill!
    assert_equal false, @alien.alive?
  end

  def test_check_if_alien_was_hit_depends_on_the_range
    @alien.position = 0
    @alien.was_hit?(4.99)
    @alien.was_hit?(-4.99)
  end

  def test_move_changes_the_aliens_position
    starting_position = @alien.position
    @alien.move(:right)
    assert_equal starting_position + 10, @alien.position
  end

  def test_position_stays_between_minus_125_and_125
    @alien.position = -120
    @alien.move(:left)
    assert_equal -125, @alien.position

    @alien.position = 120
    @alien.move(:right)
    assert_equal 125, @alien.position
  end

  def test_calculate_starting_position_returns_a_value_between_minus_125_and_125
    @alien.send(:calculate_starting_position)
    assert_includes -125...125, @alien.position
    @alien.send(:calculate_starting_position)
    assert_includes -125...125, @alien.position
    @alien.send(:calculate_starting_position)
    assert_includes -125...125, @alien.position
    @alien.send(:calculate_starting_position)
    assert_includes -125...125, @alien.position
    @alien.send(:calculate_starting_position)
    assert_includes -125...125, @alien.position
  end
end
