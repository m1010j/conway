require_relative 'inspect'

module Cell

  include Inspect

  attr_reader :location

  def initialize(attributes = {})
    defaults = { emoji_mode: false }
    attributes_with_defaults = defaults.merge(attributes)
    @emoji_mode = attributes_with_defaults[:emoji_mode]
    @location = attributes_with_defaults[:location]
  end

  def is_dead?
    !self.is_alive?
  end

  private

  attr_reader :emoji_mode

end