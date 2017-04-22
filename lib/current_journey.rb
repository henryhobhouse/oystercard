# pushes start and exit stations into hash and clears after journy end
class Current_journey

  attr_accessor :journey

  def journey_start(station)
    @start_hash = {Status: :started, Start_Time: Time.new, Start_Station: station, Error: nil}
    @journey = @start_hash
  end

  def journey_end(station)
    @finish_hash = {Status: :finished, Finish_Time: Time.new, Finish_Station: station, Error: nil}
    merge_hashes
    clear_old_journey_values
  end

  def merge_hashes
    @journey = @start_hash.merge(@finish_hash)
  end

  def clear_old_journey_values
    @start_hash = @finish_hash = nil
  end
end
