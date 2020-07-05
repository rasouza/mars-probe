require_relative '../domain/planet.rb'

RSpec.describe Planet do
  context "#initialize" do
    it "initializes with right parameters" do
      planet = Planet.new(5, 10)
      expect(planet.width).to eq 5
      expect(planet.height).to eq 10
    end
  end

  context "#within_boundary?" do
    it "false when position is out of width or height" do
      planet = Planet.new(1,1)
      boundary = planet.within_boundary?([2,2])
      expect(boundary).to be false
    end

    it "true when position is within width and height" do
      planet = Planet.new(10,10)
      boundary = planet.within_boundary?([2,2])
      expect(boundary).to be true
    end
  end
end
