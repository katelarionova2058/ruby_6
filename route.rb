require_relative 'instance_counter.rb'
require_relative 'validate.rb'
class Route
  include InstanceCounter
  include Validate  
  attr_accessor :stations 
  attr_reader   :stations, 
                :name_route
  def initialize (st_first, st_last, name_route)
    @name_route = name_route
    @stations   = [st_first, st_last]
    validate!
  end
  def add_station (station)
    @stations.insert(-2, station) unless @stations.include? station
  end
  def del_stations (station)
    return unless (@stations.first || @stations.last) != station
    @stations.delete(station)
  end
  protected
  def validate!
    raise "Название маршрута не может быть пустым" if @name_route.empty?
    raise "Названия станций на могут быть пустыми" if @stations.first.name.empty? || @stations.last.name.empty?
    #raise "Для формирования маршрута необходимо две станции" if @stations.size != 2 
    true
  end
end
