require 'singleton'
require_relative 'modules/cell'

class DeadCell
  include Singleton
  include Cell

  def live?
    false
  end

  def to_s
    # '💀 '
    "\u{1f480} "
  end

  def yellow?
    false
  end

  def purple?
    false
  end
end
