# pushes start and exit stations into hash and clears after journy end
class Journey

  attr_reader :journey_array

  def initialize
    @journey_array = []
  end

  def journey_start(station)
    @journey_array << {Status: :start, Time: Time.new, Station: station}
  end

  def journey_end(station)
    @journey_array << {Status: :end, Time: Time.new, Station: station}
  end
end
