require_relative 'live_cell'

class PliveCell < LiveCell
  def to_s
    '😈 '
    # "\u{1f601} "
  end

  def yellow?
    false
  end
end