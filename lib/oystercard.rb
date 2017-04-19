require './lib/stations.rb'
# Defines behaviour for balance based on user interaction with stations
class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(credit)
    if (@balance + credit) > MAX_BALANCE
      raise "Balance cannot exceed £#{MAX_BALANCE}!"
    end
    @balance += credit
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    raise 'balance too low!' if balance < MIN_BALANCE
    @start_station = stations.current_station
  end

  def touch_out
    deduct(MIN_FARE)
  end

  def stations
    @stations ||= Stations.new
  end

  private :deduct
end
