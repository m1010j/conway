class Display

  def initialize(attributes)
    @world = attributes[:world]
    @width = @world.width
    @height = @world.height
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

  attr_reader :world, :height, :width

end