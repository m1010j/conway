require_relative 'world'

class Game

  def initialize(world)
    @world = world
  end

  def self.make_oscillator
    world = World.new(initial_state: self.oscillator)
    self.new(world)
  end

  def tick!
    world.tick!
  end

  private

  attr_reader :world

  def self.oscillator
    [
      ["dead", "dead", "dead", "dead", "dead"],
      ["dead", "dead", "alive", "dead", "dead"],
      ["dead", "dead", "alive", "dead", "dead"],
      ["dead", "dead", "alive", "dead", "dead"],
      ["dead", "dead", "dead", "dead", "dead"],
    ]
  end
end