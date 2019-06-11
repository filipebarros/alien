# frozen_string_literal: true

GRAVITY = 9.81

# Spaceship class
class Spaceship
  VELOCITY = 35

  def shoot(angle)
    radians = convert_angle_to_radians(angle)
    (2 * Math.cos(radians) * Math.sin(radians) * (VELOCITY**2)) / GRAVITY
  end

  def valid_angle?(angle)
    angle > -45 && angle < 45
  end

  private

  def convert_angle_to_radians(angle)
    angle * Math::PI / 180
  end
end
