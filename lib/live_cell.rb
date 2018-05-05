require 'singleton'
require_relative 'modules/cell'

class LiveCell

  include Singleton
  include Cell

  def is_live?
    true
  end

  def to_s
    # '😁 '
    "\u{1f601} "
  end

  def live_after_tick?(num_live_neighbors)
    [2, 3].include?(num_live_neighbors)
  end

end