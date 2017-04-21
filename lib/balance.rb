#instiating balance with start at zero and ability to debit and credit
class Balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2

  attr_reader :value

  def initialize
    @value = 0
  end

  def top_up(credit)
    balance_over_max?(credit)
    @value += credit
  end

  def deduct(fare)
    @value -= fare
  end

  def balance_low?
    raise 'Balance too low!' if @value < MIN_BALANCE
  end

  def balance_over_max?(credit)
    if (@value + credit) > MAX_BALANCE
      raise "Balance cannot exceed £#{MAX_BALANCE}!"
    end
  end

end
