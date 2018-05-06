require 'game'
require 'world'
require 'display'
require 'modules/examples'

include Examples

describe Game do
  describe '.make_random' do
    let(:default_random_game) { Game.make_random }
    let(:five_by_five_random_game) { Game.make_random(dimensions: [5, 5]) }

    it 'by default makes random 10x10 game' do
      expect(default_random_game.send(:world).send(:dimensions)).to eq([10, 10])
    end

    it 'makes random game of size specified' do
      world_dimensions = five_by_five_random_game.send(:world).send(:dimensions)
      expect(world_dimensions).to eq([5, 5])
    end
  end

  describe '.make_#{example_name}' do
    it 'has factory methods for all examples' do
      example_names.each do |example_name|
        expect(Game).to respond_to("make_#{example_name}")
      end
    end

    it 'makes game instance for example' do
      example_names.each do |example_name|
        expect(Game.send("make_#{example_name}")).to be_a(Game)
      end
    end
  end
end
