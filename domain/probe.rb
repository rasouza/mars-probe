##
# Implements Space Probe commands
#
# Every method returns itself so you can chain multiple commands
#

class Probe

  COMPASS = {
    N: [0,1],
    E: [1,0],
    S: [0,-1],
    W: [-1,0]
  }

  attr_accessor :position, :direction, :planet

  def deploy_to(planet, position=[0,0], direction=:N)
    # TODO: check if position is possible

    @position = position
    @direction = direction

    return self
  end

  ##
  # Follows 2D Euclidean rotation rule:
  #
  # x' = xcos(theta) - ysen(theta)
  # y' = xsen(theta) + ycos(theta)

  def rotate(radians)
    @position[0] = position[0]*Math.cos(radians) - position[1]*Math.sin(radians)
    @position[1] = position[0]*Math.sin(radians) + position[1]*Math.cos(radians)

    return self
  end
end
