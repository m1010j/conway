require_relative 'world'
require_relative 'display'
require_relative 'modules/examples'

class Game

  def initialize(attributes)
    initial_state = attributes[:initial_state]
    @world = World.new(initial_state: initial_state)
    @velocity = attributes[:velocity] || 0.5
    @display = Display.new(world: @world)
  end

  def self.make_random(attributes = {})
    dimensions = attributes[:dimensions] || [10, 10]
    attributes[:initial_state] = self.random(dimensions)
    self.new(attributes)
  end

  private

  extend Examples

  public

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
      tick!
      system("clear")
      puts render
      sleep(velocity)
    end
  end

    
  private

  extend Examples  

  attr_reader :world, :display, :velocity

  def self.random(dimensions)
    states = [:live, :dead]
    grid = Array.new(dimensions.first) do
      Array.new(dimensions.last) { states.sample }
    end
  end

  def render
    display.render
  end
  
  def tick!
    world.tick!
  end
end