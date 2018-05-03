require_relative 'modules/inspect'

class Location

  include Inspect

  attr_reader :coordinates

  def initialize(attributes)
    @coordinates = attributes[:coordinates]
    @world = attributes[:world]
  end

  def neighbor_locations
    neighbor_coordinates.map do |neighbor_coordinate|
      attributes = {
        coordinates: neighbor_coordinate,
        world: world
      }
      self.class.new(attributes)
    end
  end

  def num_coordinates
    coordinates.length
  end

  private

  attr_reader :world

  def neighbor_coordinates
    deltas = [
      [0, -1],
      [1, -1],
      [1, 0],
      [1, 1],
      [0, 1],
      [-1, 1],
      [-1, 0],
      [-1, -1],
    ]

    deltas.map do |delta|
      [(x + delta.first) % world.width, (y + delta.last) % world.height]
    end
  end

  def x
    coordinates.first
  end

  def y
    coordinates.last
  end

end