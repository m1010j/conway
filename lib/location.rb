require_relative 'modules/inspect'

class Location
  include Inspect
  attr_reader :coordinate

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
    self.class.deltas(dimensions).map do |delta|
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

  def self.deltas(dimensions)
    unless @deltas
      dimensionality = dimensions.length
      negative_ones = Array.new(dimensionality) { -1 }
      zeroes = Array.new(dimensionality) { 0 }
      ones = Array.new(dimensionality) { 1 }
      base_numbers = negative_ones + zeroes + ones
      delta_perms = base_numbers.permutation(dimensionality).to_a
      unique_deltas = delta_perms.uniq
      zero_delta = Array.new(dimensionality) { 0 }
      @deltas = unique_deltas - [zero_delta]
    end
    @deltas
  end
end