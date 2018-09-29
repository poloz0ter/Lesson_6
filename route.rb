require_relative 'instance_counter.rb'

class Route
  include InstanceCounter

  def initialize(from, to)
    @from = from
    @to = to
    @stations = [from, to]
    self.register_instance
  end

  attr_reader :stations, :from, :to

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    return puts "Вы не можете удалить первую или последнюю станцию" while station == @stations.first || station == @stations.last
    @stations.delete(station)
  end

  def show_stations
    @stations.each { |station| puts station.name }
  end
end
