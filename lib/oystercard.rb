class Oystercard

MAX_BALANCE = 90

attr_reader :balance

def initialize
  @balance = 0
end

def top_up(amount)
  if ( @balance + amount ) > MAX_BALANCE; raise ArgumentError, "Balance cannot exceed £90!" end
  @balance += amount
end

def deduct(fare)
  @balance -= fare
end

end
