require 'singleton'
require_relative 'modules/cell'

class DeadCell

  include Singleton
  include Cell

  def is_live?
    false
  end

  def to_s
    # '💀 '
    "\u{1f480} "
  end

  def live_after_tick?(num_live_neighbors)
    num_live_neighbors === 3
  end

end