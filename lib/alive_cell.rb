require 'singleton'
require_relative 'modules/cell'

class AliveCell

  include Singleton
  include Cell

  def is_alive?
    true
  end

  def to_s
    '😁'
  end

end