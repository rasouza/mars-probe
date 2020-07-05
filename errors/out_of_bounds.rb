class OutOfBounds < StandardError
  attr_reader :position
  def initialize(position)
    @position = position
    super("Position #{position} is out of bounds")
  end
end
