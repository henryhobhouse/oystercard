# Defines attributes of all new stations for tube travel
class Stations
  attr_reader :stations

  def initialize
    @stations = [
      { station: 'Westminster', zone: 1 },
      { station: 'Kennington', zone: 2 },
      { station: 'Aldgate east', zone: 1 },
      { station: 'Tower Hill', zone: 4 },
      { station: 'Penge East', zone: 5 },
    ]
  end

  def current_station
    @stations.sample
  end
end
