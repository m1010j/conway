require 'singleton'
require_relative 'modules/cell'

class DeadCell

  include Singleton
  include Cell

  def is_alive?
    false
  end

  def to_s
    '☠️'
  end

end