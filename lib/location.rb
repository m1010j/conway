class Location

  attr_reader :x, :y

  def initialize(attributes)
    @x = attributes[:x]
    @y = attributes[:y]
    @world = attributes[:world]
  end

  def neighbor_locations
    neighbor_coordinates.map do |neighbor_coordinate|
      self.class.new(neighbor_coordinate.merge({world: world}))
    end
  end

  private

  attr_reader :world

  def neighbor_coordinates
    deltas = [
      {x: 0, y: -1},
      {x: 1, y: -1},
      {x: 1, y: 0},
      {x: 1, y: 1},
      {x: 0, y: 1},
      {x: -1, y: 1},
      {x: -1, y: 0},
      {x: -1, y: -1},
    ]

    deltas.map do |delta|
      {x: (x + delta[:x]) % world.width, y: (y + delta[:y]) % world.height}
    end
  end

end