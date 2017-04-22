# Adds all journeys to a log
class Journey_log
  def initialize
    @complete_log = []
  end

  def error(current_journey, in_out)
    if in_out == :touch_in_error
      current_journey[:Status] = "Error; already touched in. Penalty £6"
    else
      current_journey[:Status] = "Error; already touched out. Penalty £6"
    end
    @error_journey = current_journey
  end

  def log_current_journey(current_journey = @error_journey)
    @complete_log << current_journey
  end
end
