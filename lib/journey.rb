class Journey
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

  def in_journey?
    entry_station
  end

  def fare
    return Oystercard::PENALTY_FARE unless in_journey?
    # return Oystercard::PENALTY_FARE if in_journey?
    Oystercard::MIN_FARE
  end
end
