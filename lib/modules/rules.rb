module Rules

  def live_after_tick?(num_live_neighbors)
    live_conditions = self.is_live? ? [2, 3] : [3]
    live_conditions.include?(num_live_neighbors)
  end

end