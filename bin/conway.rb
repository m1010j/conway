#!/usr/bin/env ruby

require 'io/console'
require_relative '../lib/game.rb'

class Script

  attr_accessor :initial_state_idx, :initial_state_file, :dimensions, :velocity

  def initialize(attributes)
    @initial_state_file = attributes[:initial_state_file]
    @initial_state_idx = 0
  end

  def start
    if initial_state_file
      handle_initial_state_file
    else
      ask_initial_state
    end
  end

  private

  def handle_initial_state_file
    initial_state_lines = File.readlines(initial_state_file)
    initial_state = initial_state_lines.map do |initial_state_line|
      initial_state_line_strings = initial_state_line.chomp.split(" ")
      initial_state_line_strings.map do |initial_state_line_string|
        initial_state_line_string.to_sym
      end
    end
    system("clear")
    greeting
    velocity = ask_velocity
    game = Game.new(initial_state: initial_state, velocity: velocity)
    game.start!
  end

  def ask_initial_state
    system("clear")
    greeting
    puts ""
    puts "Select initial state (select with up/down keys, select with " + 
      "return key):"
    examples = self.class.examples
    examples.each_with_index do |example, idx|
      if initial_state_idx == idx
        puts example.upcase
      else
        puts example
      end
    end
    case read_char
    when "\e[A"
      self.initial_state_idx = (self.initial_state_idx - 1) % examples.length
      ask_initial_state
    when "\e[B"
      self.initial_state_idx = (self.initial_state_idx + 1) % examples.length
      ask_initial_state
    when "\r"
      if initial_state_idx == 0
        ask_whether_default_dimensions
      else
        game = Game.send(
          "make_#{examples[initial_state_idx]}", 
          { velocity: ask_velocity }
        )
        game.start!
      end
    end
  end

  def ask_whether_default_dimensions
    puts ""
    puts "By default, a random game has 10x10 cells."
    puts "Do you want to change these dimensions? (y/n)"
    response = STDIN.gets.chomp
    if response == "n"
      game = Game.make_random(velocity: ask_velocity)
      game.start!
    elsif response == "y"
      dimensions = ask_dimensions
      game = Game.make_random(dimensions: dimensions, velocity: ask_velocity)
      game.start!
    else 
      ask_whether_default_dimensions
    end
  end

  def ask_dimensions
    puts ""
    puts "Enter game width:"
    width = STDIN.gets.chomp.to_i
    puts "Enter game height:"
    height = STDIN.gets.chomp.to_i
    [width, height]
  end
  
  def ask_velocity
    puts ""
    puts "By default, the game ticks every 0.5 seconds."
    puts "Do you want to change this? (y/n)"
    response = STDIN.gets.chomp
    if response == "n"
      nil
    elsif response == "y"
      puts "How often do you want the game to tick, in seconds?"
      STDIN.gets.chomp.to_f
    else 
      ask_velocity
    end
  end

  def self.examples
    [
      :random,
      :blinker,
      :beacon,
      :toad,
      :pulsar,
      :pentadecathlon,
      :glider,
      :lwss,
      :block,
      :beehive,
      :loaf,
      :boat,
      :tub,
    ]
  end

  def greeting
    puts <<-'EOF'
    _____                               __   _      _  __     
   / ____|                             / _| | |    (_)/ _|    
  | |  __  __ _ _ __ ___   ___    ___ | |_  | |     _| |_ ___ 
  | | |_ |/ _` | '_ ` _ \ / _ \  / _ \|  _| | |    | |  _/ _ \
  | |__| | (_| | | | | | |  __/ | (_) | |   | |____| | ||  __/
   \_____|\__,_|_| |_| |_|\___|  \___/|_|   |______|_|_| \___|          
    EOF
  end

  def read_char
    STDIN.echo = false
    STDIN.raw!
  
    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!
  
    return input
  end

end

if $PROGRAM_NAME == __FILE__
  initial_state_file = ARGV.first
  script = Script.new(initial_state_file: initial_state_file)
  script.start
end