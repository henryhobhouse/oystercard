class Oystercard

MAX_BALANCE = 90

attr_reader :balance

def initialize
  @balance = 0
  @in_journey = false
end

def top_up(amount)
  if ( @balance + amount ) > MAX_BALANCE; raise ArgumentError, "Balance cannot exceed £90!" end
  @balance += amount
end

def deduct(fare)
  @balance -= fare
end

def touch_in
  if balance < 1; raise ArgumentError, "balance too low!" end
  @in_journey = true
end

def touch_out
  @in_journey = false
end

def in_journey?
  @in_journey
end

end
