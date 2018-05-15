module Rules
  def cell_after_tick(neighbors)
    is_live_after_tick = live_after_tick?(neighbors)
    if is_live_after_tick
      live? ? self : majority_neighbor(neighbors)
    else
      DeadCell.instance
    end
  end

  private

  def live_after_tick?(neighbors)
    live_conditions = live? ? [2, 3] : [3]
    num_live_neighbors = neighbors.count { |neighbor| neighbor.live? }
    live_conditions.include?(num_live_neighbors)
  end

  def majority_neighbor(neighbors)
    num_ylive = neighbors.count { |neighbor| neighbor.yellow? }
    num_plive = neighbors.count { |neighbor| neighbor.purple? }
    num_dead = neighbors.count { |neighbor| !neighbor.live? }
    sorted_nums = [num_ylive, num_plive, num_dead].sort
    if num_ylive > num_plive
      YliveCell.instance
    elsif num_plive > num_ylive
      PliveCell.instance
    end
  end
end
