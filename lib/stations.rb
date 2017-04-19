# Defines attributes of all new stations for tube travel
class Stations
  def initialize
    @stations = ['Westminster', 'Kennington', 'Aldgate east', 'Tower Hill']
  end

  def current_station
    @stations.sample
  end
end
