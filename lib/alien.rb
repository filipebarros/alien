
# Alien class
class Alien
  ALIEN_STEP = 10

  attr_accessor :position

  def initialize(hit_distance)
    @status = :alive
    @position = calculate_starting_position
    @hit_distance = hit_distance
  end

  def kill!
    @status = :dead
  end

  def alive?
    @status == :alive
  end

  def was_hit?(hit_point)
    (hit_point - @position).abs < @hit_distance
  end

  def move(direction)
    if direction == :right
      @position += ALIEN_STEP
    else
      @position -= ALIEN_STEP
    end

    # set maximum value
    @position = [[125, @position].min, -125].max
  end

  private

  def calculate_starting_position
    # random between -125 and 125
    @position = rand(250) - 125
  end
end
