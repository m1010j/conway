class InvalidGridError < ArgumentError
  
  def msg
    "Grid must be rectangular and must be completely filled with AliveCell and
      DeadCell instances"
  end

end