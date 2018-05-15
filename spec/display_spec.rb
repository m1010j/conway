require 'display'
require 'board'

describe Display do
  let(:initial_state) {
    [
      [:ylive, :dead, :dead],
      [:dead, :dead, :dead],
    ]
  }
  let(:board) { Board.new(initial_state: initial_state) }
  subject(:display) { Display.new(board: board, dimensions: [3, 2]) }

  describe '#render' do
    it 'renders two-dimensional grid' do
      expect(display.render(1)).to eq(
        "\u{1f601} \u{1f480} \u{1f480} \n\u{1f480} \u{1f480} \u{1f480} \n"\
        'Generation: 1'
      )
    end
  end
end
