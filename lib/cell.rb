class Cell
attr_reader :coordinate,
            :ship,
            :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    #@render_value = ""
  end

  def empty?
    ship.nil?
  end

  def place_ship(new_ship)
    @ship = new_ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if !empty?
      ship.hit
    end
    
  end

  def render
    if fired_upon? && empty?
      "M"
    else
      empty?
      "."
    end
  end

end

# ”.” if the cell has not been fired upon.
# “M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
# “H” if the cell has been fired upon and it contains a ship (the shot was a hit).
# “X” if the cell has been fired upon and its ship has been sunk.