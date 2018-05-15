require_relative 'live_cell'

class YliveCell < LiveCell
  def to_s
    '😁 '
    # "\u{1f601} "
  end

  def yellow?
    true
  end
end