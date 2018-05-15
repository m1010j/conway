module ParseExample
  def parse_example(file)
    example_lines = File.readlines(file)
    example_lines.map do |example_line|
      example_line_strings = example_line.chomp.split
      example_line_strings.map { |string| cell_map[string] }
    end
  end

  private

  def cell_map
    {
      'live' => :ylive,
      'ylive' => :ylive,
      'plive' => :plive,
      'dead' => :dead,
    }
  end
end
