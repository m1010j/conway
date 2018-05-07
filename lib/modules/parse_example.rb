module ParseExample
  def parse_example(file)
    example_lines = File.readlines(file)
    example_lines.map do |example_line|
      example_line_strings = example_line.chomp.split
      example_line_strings.map(&:to_sym)
    end
  end
end
