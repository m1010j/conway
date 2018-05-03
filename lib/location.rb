require_relative 'modules/inspect'

class Location

  include Inspect

  attr_reader :coordinates

  def initialize(attributes)
    @coordinate = attributes[:coordinate]
    @dimensions = attributes[:dimensions]
  end

  def neighbor_locations
    neighbor_coordinates.map do |neighbor_coordinate|
      attributes = {
        coordinate: neighbor_coordinate,
        dimensions: dimensions
      }
      self.class.new(attributes)
    end
  end

  def num_coordinates
    coordinate.length
  end

  private

  attr_reader :dimensions

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
      [
        (x + delta.first) % dimensions.first,
        (y + delta.last) % dimensions.last
      ]
    end
  end

  def x
    coordinate.first
  end

  def y
    coordinate.last
  end

end