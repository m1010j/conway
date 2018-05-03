require_relative 'inspect'

module Cell

  include Inspect

  def is_dead?
    !self.is_alive?
  end

  private

end