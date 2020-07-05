##
# Implements Space Probe commands
#
# Every method returns itself so you can chain multiple commands

class Probe

  COMPASS = {
    N: [0,1],
    E: [1,0],
    S: [0,-1],
    W: [-1,0]
  }

  attr_accessor :position, :direction, :planet

  ##
  # Deploys a Space Probe into an existent planet
  #
  # The Probe must be deployed on a valid position,
  # otherwise it will raise an OutOfBounds exception

  def deploy_to!(planet, position=[0,0], direction=:N)
    @planet = planet
    raise OutOfBounds.new(position) unless planet.within_boundary?(position)

    @position = position
    @direction = COMPASS[direction]

    return self
  end

  ##
  # Follows 2D Euclidean rotation rule:
  #
  # x' = xcos(theta) - ysen(theta)
  # y' = xsen(theta) + ycos(theta)

  def rotate(radians)
    x = (direction[0]*Math.cos(radians) - direction[1]*Math.sin(radians)).round
    y = (direction[0]*Math.sin(radians) + direction[1]*Math.cos(radians)).round

    @direction = [x, y]

    return self
  end

  ##
  # Move Space Probe 1 tile in its current direction
  #
  # There must be a valid position to be moved into,
  # otherwise it will raise an OutOfBounds exception

  def move!
    x, y = position

    x += direction[0]
    y += direction[1]
    new_position = [x, y]
    raise OutOfBounds.new(new_position) unless planet.within_boundary?(new_position)

    @position = new_position
    return self
  end

  ##
  # Commands Space Probe to take a picture of its surroundings
  #
  # Since there's no specification of what the Space Probe should do,
  # it will only notify about it
  def take_picture
    puts "Taking picture from #{position}"
  end

  ##
  # to_s method defines how to output a Space Probe as a string

  def to_s
    "#{position[0]} #{position[1]} #{COMPASS.key(direction)}"
  end
end
