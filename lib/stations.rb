# Defines attributes of all new stations for tube travel
class Stations
  attr_reader :stations

  def initialize
    @stations = ['Westminster', 'Kennington', 'Aldgate east', 'Tower Hill', 'Penge East']
  end

  def current_station
    @stations.sample
  end
end
