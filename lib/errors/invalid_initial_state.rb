class InvalidInitialStateError < ArgumentError
  
  def msg
    "Initial state must be a non-empty array all of whose members are non-empty 
      arrays of equal length that only contain 'alive' or 'dead' strings"
  end

end