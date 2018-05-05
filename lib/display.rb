class Display

  def initialize(attributes)
    @world = attributes[:world]
    @dimensions = @world.dimensions
  end

  def render
    result_string = ""
    height.times do |y|
      width.times do |x|
        location = Location.new(coordinate: [x, y], dimensions: [width, height])
        cell = world.cell_at(location)
        result_string += cell.to_s
      end
      result_string += "\n"
    end
    result_string.chomp
  end

  private

  attr_reader :world, :dimensions

  def width
    dimensions.first
  end

  def height
    dimensions.last
  end

end