##
# Parses commands from file or STDIN

class CLI
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def run
    planet = parse_planet
  end

  private

  def parse_planet
    size = content.gets.split(' ')

    Planet.new(*size)
  end
end
