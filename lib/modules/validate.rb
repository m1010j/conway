require_relative '../errors/invalid_initial_state'

module Validate

  def validate_initial_state!(initial_state)
    unless initial_state_is_valid?(initial_state)
      raise InvalidInitialStateError
    end
  end

  def initial_state_is_valid?(initial_state)
    return false unless initial_state
  
    flattened = initial_state.flatten
    only_dead_or_live?(flattened) && is_equilateral?(initial_state)
  end
  
  def only_dead_or_live?(cell_state_array)
    cell_state_array.all? do |cell_state| 
      cell_state == :live || cell_state == :dead
    end
  end

  def is_equilateral?(array)
    init_state_dimensionality = array_dimensionality(array)
    case init_state_dimensionality
    when 1
      true
    when 2
      width = array[0].length
      array.all? { |row| row.length == width }
    else
      array.all? { |inner_array| is_equilateral?(inner_array) }
    end
  end

  def array_dimensionality(array, dimensionality_memo = 0)
    return dimensionality_memo unless array.is_a?(Array)

    inner_dimens = array_dimensionality(array.first, dimensionality_memo + 1)
  end

end