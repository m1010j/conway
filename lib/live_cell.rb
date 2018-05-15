require 'singleton'
require_relative 'modules/cell'

class LiveCell
  include Singleton
  include Cell

  def to_s
    raise NotImplementedError
  end

  def yellow?
    raise NotImplementedError
  end

  def live?
    true
  end

  def purple?
    !yellow?
  end
end