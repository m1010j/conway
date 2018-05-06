require_relative 'board'
require_relative 'world'
require_relative 'display'
require_relative 'modules/examples'

class Game

  def initialize(attributes)
    initial_state = attributes[:initial_state]
    dimensions = self.class.extract_dimensions(initial_state)
    @board = Board.new(initial_state: initial_state)
    @world = World.new(
      initial_state: initial_state,
      board: board,
      dimensions: dimensions
    )
    @display = Display.new(board: board, dimensions: dimensions)
    @velocity = attributes[:velocity] || 0.5
  end

  def self.make_random(attributes = {})
    dimensions = attributes[:dimensions] || [10, 10]
    attributes[:initial_state] = random(dimensions)
    new(attributes)
  end

  private

  extend Examples

  public

  examples = self.examples
  examples.keys.each do |example_key|
    define_singleton_method("make_#{example_key}") do |attributes = {}|
      example = examples[example_key]
      attributes[:initial_state] = example
      new(attributes)
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

  attr_reader :board, :world, :display, :velocity

  def self.extract_dimensions(array)
    height = array.length
    width = array[0].length
    [width, height]
  end

  def self.random(dimensions)
    states = [:live, :dead]
    grid = Array.new(dimensions.first) do
      Array.new(dimensions.last) { states.sample }
    end
  end

  def render
    generation = world.generation
    display.render(generation)
  end
  
  def tick!
    world.tick!
  end
end