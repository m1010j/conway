class InvalidInitialStateError < ArgumentError
  def msg
    "Initial state must be an equilateral two-dimensional grid of 'dead', "\
    " 'ylive', and 'plive' cells"
  end
end
