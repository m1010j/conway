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
        result_string += cell_string_at(location)
      end
      result_string += "\n"
    end
    result_string += "Generation: #{generation}"
  end

  private

  attr_reader :world, :dimensions

  def width
    dimensions.first
  end

  def height
    dimensions.last
  end

  def cell_at(location)
    world.cell_at(location)
  end

  def cell_string_at(location)
    cell_at(location).to_s
  end

  def generation
    world.generation
  end

end