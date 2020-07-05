class Parser
  class << self
    def position(position)
      x, y, direction = position.split(' ')

      position = [x, y].map(&:to_i)
      direction = direction.to_sym

      [position, direction]
    end

    def planet(size)
      size.split(' ').map(&:to_i)
    end
  end
end
