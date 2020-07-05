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
    @direction[0] = (direction[0]*Math.cos(radians) - direction[1]*Math.sin(radians)).round
    @direction[1] = (direction[0]*Math.sin(radians) + direction[1]*Math.cos(radians)).round

    return self
  end

  ##
  # Move Space Probe 1 tile in its current direction

  def move!()
    x, y = position


    x += direction[0]
    y += direction[1]
    new_position = [x, y]
    raise OutOfBounds.new(new_position) unless planet.within_boundary?(new_position)

    return self
  end
end
