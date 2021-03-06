class Journey
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def add_entry(station)
    @entry_station = station
  end

  def add_exit(station)
    @exit_station = station
  end

  def trip
    [entry_station: entry_station, exit_station: exit_station]
  end

  def reset
    @entry_station, @exit_station = nil, nil
  end

  def fare
    return PENALTY_FARE unless complete?
    Oystercard::MIN_FARE
  end

  def complete?
    !!entry_station === !!exit_station
  end
end
