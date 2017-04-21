require './lib/stations.rb'
require './lib/balance.rb'

# Defines behaviour for balance based on user interaction with stations
class Oystercard
  MIN_FARE = 2

  attr_reader :balance, :start_station

  def initialize
    @balance = Balance.new
  end

  def touch_in
    raise 'Balance too low!' if @balance.value < Balance::MIN_BALANCE
    @start_station = stations_instance.current_station
  end

  def touch_out
    @balance.deduct(MIN_FARE)
  end

  def stations_instance
    @stations ||= Stations.new
  end

end
