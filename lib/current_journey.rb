# pushes start and exit stations into hash and clears after journy end
class Current_journey

  attr_reader :result

  def journey_start(station)
    @start_hash = {Status: :started, Start_Time: Time.new, Start_Station: station}
  end

  def journey_end(station)
    @finish_hash = {Status: :finished, Finish_Time: Time.new, Finish_Station: station}
    complete
    clear
  end

  def complete
    @result = @start_hash.merge(@finish_hash)
  end

  def clear
    @start_hash = nil
    @finish_hash = nil
  end

end
