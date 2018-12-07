require_relative 'station'
require_relative 'journey'

class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :history, :journey

  def initialize(journey = Journey.new)
    @journey = journey
    @balance = 0
    @history = []
  end

  def top_up(amount)
    raise "Maximum balance is #{MAX_BALANCE}" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Balance is less than #{MIN_FARE}" if balance < MIN_FARE
    deduct(journey.fare) unless journey.complete?
    journey.add_entry(station)
  end

  def touch_out(station)
    journey.add_exit(station)
    deduct(journey.fare)
    add_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def add_journey
    @history << journey.trip
    journey.reset
  end

end
