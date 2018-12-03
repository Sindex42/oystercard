class Oystercard
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "Maximum balance is #{MAX_BALANCE}" if (@balance + money) > MAX_BALANCE
    @balance += money
  end

end
