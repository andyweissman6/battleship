require 'colorize'

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
      "S".yellow
    elsif !fired_upon?
      "."
    elsif fired_upon? && empty?
      "M".red
    elsif @ship.sunk? 
      "X"
    else 
      "H".green
    end
  end
end

