require_relative 'world'
require_relative 'display'
require_relative 'examples/examples'
class Game

  extend Examples

  def initialize(attributes)
    attributes = self.class.default_attributes.merge(attributes)
    @world = attributes[:world]
    @velocity = attributes[:velocity]
    @display = Display.new(world: @world)
  end

  def self.make_random(options = {})
    dimensions = options[:dimensions] || [10, 10]
    world = World.new(initial_state: self.random(dimensions))
    options[:world] = world
    self.new(options)
  end

  examples = self.examples
  examples.keys.each do |example_key|
    define_singleton_method("make_#{example_key}") do |attributes = {}|
      example = examples[example_key]
      world = World.new(initial_state: example)
      attributes[:world] = world
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

  def self.default_attributes
    { velocity: 0.5 }
  end

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