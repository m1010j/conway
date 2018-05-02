require_relative 'modules/cell'

class AliveCell

  include Cell

  def is_alive?
    true
  end

  def to_s
    boring_mode ? 'o' : '🤩'
  end

end