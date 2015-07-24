require_relative 'lib/alien'
require_relative 'lib/spaceship'

spaceship = Spaceship.new
alien = Alien.new(5)

while alien.alive?
  puts 'To what angle you want to fire? (between -45 and 45)'
  angle = gets.to_f
  if spaceship.valid_angle?(angle)
    hit_point = spaceship.shoot(angle)
    puts "Hit point: #{hit_point}"
    if alien.was_hit?(hit_point)
      alien.kill!
      puts 'The alien was killed!'
    else
      alien.move([:left, :right].sample)
      puts "You missed the alien. The alien is at #{alien.position}"
    end
  else
    puts 'Angle not valid'
  end
end
