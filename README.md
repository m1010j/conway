# Conway's Game of Life

## An emoji-themed Ruby implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

![pulsar-demo](./media/pulsar-demo.gif 'Pulsar Demo')

### Code status

[ ![Codeship Status for m1010j/conway](https://app.codeship.com/projects/e0206780-33c7-0136-a162-2e6dfbb19319/status?branch=master)](https://app.codeship.com/projects/288978)

### Contents

1.  [Features](#features)
2.  [Installation and use](#installation-and-use)
3.  [Future directions](#future-directions)
4.  [License](#license)

### Features

1.  #### Development was driven by an emphasis on reliability, maintainability, and extensibility.

2.  #### Contains thirteen worlds, generates random worlds of arbitrary size, and reads in plain text worlds.

3.  #### Handles out of range cells by wrapping them around the toroidal world.

4.  #### Exemplifies [Kent Beck's Four Rules of Design](https://martinfowler.com/bliki/BeckDesignRules.html):

    a. **Passes the tests**

    * Includes thirty-one RSpec unit and integration tests.

    b. **Reveals intention**

    * Leverages idiomatic Ruby, concise methods, minimal public interfaces, and semantic method names for easy code readability.

    c. **No duplication**

    * Relies on modules to maximize code reusability.

    d. **Fewest elements**

    * Eschews any code not mandated by the first three rules.

5.  #### Exemplifies [SOLID Principles](https://subvisual.co/blog/posts/19-solid-principles-in-ruby/):

    a. **<i>S</i>ingle responsibility principle**

    * Each class only has one responsibility.

    b. **<i>O</i>pen/closed principle**

    * Relies on a `Location` class to ensure openness to changes in dimensionality and a `Rules` modules to ensure openness to rule changes.

    c. **<i>L</i>iskov substitution principle**

    * The `Display` class is unaware of what cell type it's dealing with.

    d. **<i>I</i>nterface segregation principle**

    * Minimizes classes that are depended upon by multiple classes.

    e. **<i>D</i>ependency inversion principle**

    * The `World` and `Display` classes exemplify dependency injection.

### Installation and use

1.  Download the repo and `cd` into it:
    ```console
    $ git clone https://github.com/m1010j/conway.git && cd conway/
    ```
2.  a. Run `conway` script without any arguments and select one of the built-in example worlds:

    ```console
    $ ./conway
    ```

    b. Run `conway` with a plain text file :

    * Generate [plain text](./octagon.txt) file where `dead` represents a dead cell and `live` a live one:

      ```console
      $ line0="dead dead dead dead dead dead dead dead dead dead"
      $ line1="dead dead dead dead dead dead dead dead dead dead"
      $ line2="dead dead dead live live live live dead dead dead"
      $ line3="dead dead live dead live live dead live dead dead"
      $ line4="dead dead live live dead dead live live dead dead"
      $ line5="dead dead live live dead dead live live dead dead"
      $ line6="dead dead live dead live live dead live dead dead"
      $ line7="dead dead dead live live live live dead dead dead"
      $ line8="dead dead dead dead dead dead dead dead dead dead"
      $ line9="dead dead dead dead dead dead dead dead dead dead"
      $ octagon="$line0\n$line1\n$line2\n$line3\n$line4\n$line5\n$line6\n$line7\n$line8\n$line9"
      $ echo -e $octagon > ./octagon.txt
      ```

    * Run `conway` with this file as an argument:

      ```console
      $ ./conway octagon.txt
      ```

3.  Quit at any point with `Ctrl`+`C`.

### Future directions

* ⚡️ Improve performance by avoiding checking cells that don't need to be checked in a given tick.
* 📜 Incorporate alternative rule sets. The foundations for this are laid by the dedicated `Rules` module.
* 🌏 Allow one- and three-dimensional worlds. The foundations for this are laid by the way the `Location` class calculates the deltas:
  ```ruby
  def self.deltas(dimensions)
    unless @deltas
      dimensionality = dimensions.length
      negative_ones = Array.new(dimensionality) { -1 }
      zeroes = Array.new(dimensionality) { 0 }
      ones = Array.new(dimensionality) { 1 }
      base_numbers = negative_ones + zeroes + ones
      delta_perms = base_numbers.permutation(dimensionality).to_a
      unique_deltas = delta_perms.uniq
      zero_delta = Array.new(dimensionality) { 0 }
      @deltas = unique_deltas - [zero_delta]
    end
    @deltas
  end
  ```
* ✨ Add more example worlds, group them into categories. The foundations for this are laid by the way the `Game` class dynamically generates its own class methods based on the contents of the `./examples` directory and by the way the `Conway` class dynamically renders the list of examples:

  ```ruby
  # game.rb

  examples = self.examples
  examples.keys.each do |example_key|
    define_singleton_method("make_#{example_key}") do |attributes = {}|
      example = examples[example_key]
      attributes[:initial_state] = example
      self.new(attributes)
    end
  end
  ```

  ```ruby
  # conway

  def render_examples
    example_names = [:random] + self.class.example_names
    example_names.each_with_index do |example_name, idx|
      if initial_state_idx == idx
        puts example_name.upcase
      else
        puts example_name
      end
    end
  end
  ```

* 📈 Allow worlds to grow unboundedly.
* 🖥 Create UI to select a world's initial state without relying on text files. The foundations for this are laid by the dedicated `Display` class.

### License

[Unlicense](./LICENSE)
