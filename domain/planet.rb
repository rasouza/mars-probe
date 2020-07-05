class Planet
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def within_boundary?(position)
    x, y = position

    raise OutOfBounds.new(position) \
      unless (0..width).include?(x) and (0..height).include?(y)
  end
end
