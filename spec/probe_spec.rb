require_relative "../domain/probe.rb"
require_relative "../errors/out_of_bounds.rb"

RSpec.describe Probe do
  before(:each) do
    @planet = Planet.new(5,10)
  end

  context "#deploy_to" do
    it "deploys in the right position" do
      probe = Probe.new
      probe.deploy_to!(@planet, [1,1], :N)

      expect(probe.position).to eq [1,1]
    end

    it "throws an error when deploying out of bounds" do
      probe = Probe.new

      expect{
        probe.deploy_to!(@planet, [100,100], :N)
      }.to raise_error(OutOfBounds)
    end
  end

  context "#rotate" do
    it "points to West when rotates left from North" do
      probe = Probe.new
      probe.deploy_to!(@planet, [1,1], :N)

      probe.rotate(Math::PI/2)

      expect(Probe::COMPASS.key(probe.direction)).to eq :W
    end
    it "points to East when rotates right from North" do
      probe = Probe.new
      probe.deploy_to!(@planet, [1,1], :N)

      probe.rotate(-Math::PI/2)

      expect(Probe::COMPASS.key(probe.direction)).to eq :E
    end
  end

  context "#move!" do
    context "when facing North" do
      it "moves from [3,1] to [3,2]" do
        probe = Probe.new
        probe.deploy_to!(@planet, [3,1], :N)

        probe.move!

        expect(probe.position).to eq [3,2]
      end
    end

    context "when facing East" do
      it "moves from [3,1] to [4,1]" do
        probe = Probe.new
        probe.deploy_to!(@planet, [3,1], :E)

        probe.move!

        expect(probe.position).to eq [4,1]
      end
    end

    context "when is on the edge of the planet" do
      it "throws an error when moving out of bounds" do
        probe = Probe.new
        probe.deploy_to!(@planet, [5,10], :N)

        expect{
          probe.move!
        }.to raise_error(OutOfBounds)
      end
    end
  end

  context "#to_s" do
    it "prints its position and direction" do
      probe = Probe.new
      probe.deploy_to!(@planet, [5,10], :N)

      expect(probe.to_s).to eq "5 10 N"
    end
  end
end
