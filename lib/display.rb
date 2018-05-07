require_relative 'location'

class Display
  def initialize(attributes)
    @board = attributes[:board]
    @dimensions = attributes[:dimensions]
  end

  def render(generation)
    result_string = ''
    height.times do |y|
      width.times do |x|
        location = Location.new(coordinate: [x, y], dimensions: [width, height])
        result_string += board.to_s(location)
      end
      result_string += "\n"
    end
    result_string += "Generation: #{generation}"
  end

  private

  attr_reader :board, :dimensions

  def width
    dimensions.first
  end

  def height
    dimensions.last
  end
end
