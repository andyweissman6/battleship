class Cell
attr_reader :coordinate,
            :ship,
            :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
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

  def render(access = false)
    if access == true && !empty? && !fired_upon?
      "S"
    elsif !fired_upon?
      "."
    elsif fired_upon? && empty?
      "M"
    elsif @ship.sunk? 
      "X"
    else 
      "H"
    end
  end
end

# ”.” if the cell has not been fired upon.
# “M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
# “H” if the cell has been fired upon and it contains a ship (the shot was a hit).
# “X” if the cell has been fired upon and its ship has been sunk.