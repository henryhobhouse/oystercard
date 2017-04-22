require './lib/stations.rb'
require './lib/balance.rb'
require './lib/current_journey.rb'
require './lib/journey_log.rb'

# Defines behaviour for balance based on user interaction with stations
class Oystercard

  attr_reader :balance, :start_station, :journey_log

  def initialize
    @balance = Balance.new
  end

  def touch_in
    @balance.balance_low?
    if journey_current.journey == nil
      journey_current.journey_start(stations_instance.current_station)
    elsif journey_current.journey[:Status] == :started
      error_process(:touch_in_error)
    end
    journey_current.journey_start(stations_instance.current_station)
  end

  def touch_out
    @balance.deduct(Balance::MIN_FARE)
    if journey_current.journey == nil || journey_current.journey[:Status] == :finished
      error_process(:touch_out_error)
    end
    journey_current.journey_end(stations_instance.current_station)
    journey_log.log_current_journey(journey_current.journey)
  end

  def stations_instance
    @stations ||= Stations.new
  end

  def journey_current
    @journey_current ||= Current_journey.new
  end

  def journey_log
    @journey_log ||= Journey_log.new
  end

  def error_process(in_out)
    @balance.penalty
    journey_log.error(journey_current.journey, in_out)
    journey_log.log_current_journey
  end
end
