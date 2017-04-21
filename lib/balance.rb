#instiating balance with start at zero and ability to debit and credit
class Balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :value

  def initialize
    @value = 0
  end

  def top_up(credit)
    if (@value + credit) > MAX_BALANCE
      raise "Balance cannot exceed £#{MAX_BALANCE}!"
    end
    @value += credit
  end

  def deduct(fare)
    @value -= fare
  end
end
