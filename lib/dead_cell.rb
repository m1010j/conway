require_relative 'modules/cell'

class DeadCell

  include Cell

  def is_alive?
    false
  end

  def to_s
    emoji_mode ? '☠️' : 'x'
  end

end