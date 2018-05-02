require_relative 'modules/cell'

class DeadCell

  include Cell

  def is_alive?
    false
  end

  def to_s
    boring_mode ? 'x' : '😵'
  end

end