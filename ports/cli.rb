##
# Parses commands from file or STDIN

class CLI
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def run
    planet = create_planet
    each_probe(planet) do |probe|
      p probe
    end
  end

  private

  def create_planet
    size = Parser::planet(content.gets)

    Planet.new(*size)
  end

  def each_probe(planet)
    content.readlines.map(&:chomp).each_slice(2) do |commands|
      probe = Probe.new
      probe.deploy_to!(planet, *Parser::position(commands[0]))
      yield probe
    end
  end
end
