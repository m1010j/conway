require_relative 'parse_example'

module Examples
  include ParseExample

  def examples
    examples = {}
    example_filepaths = Dir["#{File.dirname(__FILE__)}/../../examples/*.txt"]
    example_filepaths.each do |example_file|
      example_filename = example_file.split('/').last
      example_string = example_filename[0..-5]
      example_symbol = example_string.to_sym
      examples[example_symbol] = parse_example(example_file)
    end
    examples
  end

  def example_names
    examples.keys.sort
  end
end