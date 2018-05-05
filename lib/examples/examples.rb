module Examples

  def examples
    {
      blinker: [
        [:dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead],
      ],
      beacon: [
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :live, :live, :dead, :dead, :dead],
        [:dead, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :dead],
        [:dead, :dead, :dead, :live, :live, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
      ],
      toad: [
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :live, :live, :dead],
        [:dead, :live, :live, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
      ],
      pulsar: [
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :live, :dead, :dead, :dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
      ],
      pentadecathlon: [
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :dead, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :dead, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :live, :live, :live, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
      ],
      glider: [
        [:dead, :live, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:live, :live, :live, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
      ],
      lwss: [
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :live, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :live, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead, :live, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :live, :live, :live, :live, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead],
      ],
      block: [
        [:dead, :dead, :dead, :dead],
        [:dead, :live, :live, :dead],
        [:dead, :live, :live, :dead],
        [:dead, :dead, :dead, :dead],
      ],
      beehive: [
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :live, :dead, :dead],
        [:dead, :live, :dead, :dead, :live, :dead],
        [:dead, :dead, :live, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
      ],
      loaf: [
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :live, :dead, :dead],
        [:dead, :live, :dead, :dead, :live, :dead],
        [:dead, :dead, :live, :dead, :live, :dead],
        [:dead, :dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
      ],
      boat: [
        [:dead, :dead, :dead, :dead, :dead],
        [:dead, :live, :live, :dead, :dead],
        [:dead, :live, :dead, :live, :dead],
        [:dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead],
      ],
      tub: [
        [:dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :dead, :dead],
        [:dead, :live, :dead, :live, :dead],
        [:dead, :dead, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead],
      ]
    }
end

end