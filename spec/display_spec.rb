require 'display'
require 'world'

describe Display do

  let(:initial_state) {
    [
      [:live, :dead, :dead],
      [:dead, :dead, :dead],
    ]
  }
  let(:world) { World.new(initial_state: initial_state) }
  subject(:display) { Display.new(world: world) }


  describe '#render' do
    it 'renders two-dimensional grid' do
      expect(display.render).to eq(
        "\u{1f601} \u{1f480} \u{1f480} \n\u{1f480} \u{1f480} \u{1f480} \n" +
        "Generation: 0"
      )
    end
  end


end