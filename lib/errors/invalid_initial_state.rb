class InvalidInitialStateError < ArgumentError
    def msg
    "Initial state must be an equilateral two-dimensional grid of 'dead' and" +
      " 'alive' cells"
  end
end