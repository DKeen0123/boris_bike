require_relative "bike"

class DockingStation
  #this replaces bike method below - allows .bike to read the @bike variable
  attr_reader :bike
  #method is initialized as an empty docking station with a collection to hold Bike objects.
  def initialize
    @bike_rack = []
  end
  #if there are bikes in the rack, one is taken from the end, else an error is given
  def release_bike
    # Create a variable = Instantiation of class to be returned
    raise "No bikes available" if empty?
    @bike_rack.pop
  end
  #a bike can be docked - pushed into the bike_rack. if the rack has 20 bikes, it is full
  #and an error is raised
  def dock(bike)
    raise "Dock is full" if full?
    @bike_rack.push(@bike)
    @bike = bike
  end

  private
  def full?
    @bike_rack.count >= 20
  end

  def empty?
    @bike_rack.empty?
  end

  #def bike
  #  @bike
  #end
end
