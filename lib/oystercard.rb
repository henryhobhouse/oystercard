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
    @start_station = stations_instance.current_station
    journey_instance.journey_start(@start_station)
  end

  def touch_out
    @balance.deduct(Balance::MIN_FARE)
    @exit_station = stations_instance.current_station
    journey_instance.journey_end(@exit_station)
    journey_log(journey_instance.last_journey)
  end

  def stations_instance
    @stations ||= Stations.new
  end

  def journey_instance
    @journey ||= Current_journey.new
  end

  def journey_log(complete_journey)
    @journey_log ||= Journey_log.new(complete_journey)
  end
end
