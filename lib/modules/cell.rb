module Cell

  def initialize(attributes = {})
    attributes_with_defaults = { boring_mode: true }.merge(attributes)
    @boring_mode = attributes_with_defaults[:boring_mode]
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