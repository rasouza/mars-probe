require_relative '../ports/parser'
require_relative '../errors//command_not_found'

RSpec.describe Parser do
  context "#position" do
    it 'returns parsed position and direction' do
      position = Parser::position('1 3 N')

      expect(position).to eq [[1,3], :N]
    end
  end

  context "#planet" do
    it 'returns parsed planet size' do
      planet = Parser::planet('10 11')

      expect(planet).to eq [10, 11]
    end
  end

  context "#commands" do
    context "LMRP" do
      it 'returns a chain of commands' do
        chain = Parser::commands('LMRP')

        L = [:rotate, Math::PI/2]
        M = :move!
        R = [:rotate, -Math::PI/2]
        P = :take_picture

        expect(chain).to eq [L,M,R,P]
      end
    end

    context "when command doesn't exist" do
      it 'throws an error' do
        expect { Parser::commands('UBQS') }.to raise_error(CommandNotFound)
      end
    end
  end
end
