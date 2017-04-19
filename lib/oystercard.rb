class Oystercard

MAX_BALANCE = 90
MIN_BALANCE = 1
MIN_FARE = 2

attr_reader :balance

def initialize
  @balance = 0
  @in_journey = false
end

def top_up(credit)
  raise ArgumentError, "Balance cannot exceed £#{MAX_BALANCE}!" if ( @balance + credit ) > MAX_BALANCE
  @balance += credit
end

def deduct(fare)
  @balance -= fare
end

def touch_in
  raise "balance too low!" if balance < MIN_BALANCE
  @in_journey = true
end

def touch_out
  deduct(MIN_FARE)
  @in_journey = false
end

def in_journey?
  @in_journey
end

end
