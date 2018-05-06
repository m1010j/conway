require 'singleton'
require_relative 'modules/cell'

class LiveCell
  include Singleton
  include Cell

  def live?
    true
  end

  def to_s
    # '😁 '
    "\u{1f601} "
  end
end