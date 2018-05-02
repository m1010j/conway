module Cell

  attr_reader :location

  def initialize(attributes = {})
    defaults = { boring_mode: true }
    attributes_with_defaults = defaults.merge(attributes)
    @boring_mode = attributes_with_defaults[:boring_mode]
    @location = attributes_with_defaults[:location]
  end

  def inspect
    self.to_s
  end

  def is_dead?
    !self.is_alive?
  end

  private

  attr_reader :boring_mode

end