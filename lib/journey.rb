class Journey
  attr_reader :entry_station, :exit_station

  def initialize(station)
    @entry_station = station
  end

  def exit(station)
    @exit_station = station
  end

  def trip
    { entry_station: entry_station, exit_station: exit_station }
  end

end
