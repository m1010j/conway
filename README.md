# Conway's Game of Life

## An emoji-themed Ruby implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

![pulsar-demo](./media/pulsar-demo.gif 'Pulsar Demo')

### Contents

1.  [Features](#features)
2.  [Installation and use](#installation-and-use)
3.  [Future directions](#future-directions)
4.  [License](#license)

### Features

1.  #### Development was driven by an emphasis on reliability, maintainability, and extensibility.

2.  #### Contains thirteen worlds, generates random worlds of arbitrary size, and reads in plain text worlds.

3.  #### Handles out of range cells by wrapping them around the world.

4.  #### Exemplifies [Kent Beck's Four Rules of Design](https://martinfowler.com/bliki/BeckDesignRules.html):

    a. **Passes the tests**

    * Includes 30 unit and integration tests to ensure reliability.

    b. **Reveals intention**

    * Leverages idiomatic Ruby, concise methods, minimal public interfaces, and semantic method names for easy code readability.

    c. **No duplication**

    * Relies on modules to maximize code reusability.

    d. **Fewest elements**

    * Eschews any code not mandated by the other three rules.

5.  #### Exemplifies [SOLID Principles](https://subvisual.co/blog/posts/19-solid-principles-in-ruby/):

    a. **<i>S</i>ingle responsibility principle**

    * Each class only has one responsibility.

    b. **<i>O</i>pen/closed principle**

    * Relies on a `Location` class to ensure openness to changes in dimensionality and a `Rules` modules to ensure openness to rule changes.

    c. **<i>L</i>iskov substitution principle**

    * The `Display` class is unaware of what cell type it's dealing with.

    d. **<i>I</i>nterface segregation principle**

    * Minimizes classes that depended upon by multiple classes.

    e. **<i>D</i>ependency inversion principle**

    * The `Display` class exemplifies dependency injection.

### Installation and use

1.  Download the repo and `cd` into it:
    ```console
    $ git clone https://github.com/m1010j/conway.git
    $ cd conway
    ```
2.  a. Select one of the built-in example worlds:

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

## Future directions

* 📜 Incorporate alternative rule sets.
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
* 📈 Allow worlds to grow unboundedly.
* 🖥 Create UI to select a world's initial state without relying on text files.
* ⚡️ Improve performance by avoiding checking cells that don't need to be checked for a given tick.

### License

[Unlicense](./LICENSE)
