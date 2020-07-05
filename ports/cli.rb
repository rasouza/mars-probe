##
# Parses commands from file or STDIN

class CLI
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def run
    planet = create_planet
    each_probe(planet) do |probe, commands|
      commands.each { |command| probe.send(*command) }
      puts probe
    end
  rescue OutOfBounds => e
    puts "The Probe has fallen to the void, near #{e.position}"
  end

  private

  def create_planet
    size = Parser::planet(content.gets)

    Planet.new(*size)
  end

  def each_probe(planet)
    content.readlines.map(&:chomp).each_slice(2) do |group|
      probe = Probe.new
      probe.deploy_to!(planet, *Parser::position(group[0]))

      commands = Parser::commands(group[1])

      yield probe, commands
    end
  end
end
