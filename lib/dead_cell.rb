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

end