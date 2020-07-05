class Planet
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def within_boundary?(position)
    x, y = position

    return (0..width).include?(x) && (0..height).include?(y)
  end
end
