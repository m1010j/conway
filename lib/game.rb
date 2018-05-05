require_relative 'world'
require_relative 'display'
require_relative 'examples/examples'
class Game

  extend Examples

  def initialize(attributes)
    initial_state = attributes[:initial_state]
    @world = World.new(initial_state: initial_state)
    @velocity = attributes[:velocity] || 0.5
    @display = Display.new(world: @world)
  end

  def self.make_random(attributes = {})
    dimensions = attributes[:dimensions] || [10, 10]
    attributes[:initial_state] = self.random(dimensions)
    attributes[:world] = world
    self.new(attributes)
  end

  examples = self.examples
  examples.keys.each do |example_key|
    define_singleton_method("make_#{example_key}") do |attributes = {}|
      example = examples[example_key]
      attributes[:initial_state] = example
      self.new(attributes)
    end
  end
  
  def start!
    while true
      system("clear")
      tick!
      puts self.render
      sleep(velocity)
    end
  end

  def render
    display.render
  end
    
  private

  attr_reader :world, :display, :velocity

    def self.random(dimensions)
      states = [:live, :dead]
      grid = Array.new(dimensions.first) do
        Array.new(dimensions.last) { states.sample }
      end
    end
  
  def tick!
    world.tick!
  end
end