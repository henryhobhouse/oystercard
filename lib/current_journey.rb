# pushes start and exit stations into hash and clears after journy end
class Current_journey

  attr_reader :last_journey

  def journey_start(station)
    @start_hash = {Status: :started, Start_Time: Time.new, Start_Station: station}
  end

  def journey_end(station)
    @finish_hash = {Status: :finished, Finish_Time: Time.new, Finish_Station: station}
    merge_hashes
    clear_journey_values
  end

  def merge_hashes
    @last_journey = @start_hash.merge(@finish_hash)
  end

  def clear_journey_values
    @start_hash = nil
    @finish_hash = nil
  end

end
