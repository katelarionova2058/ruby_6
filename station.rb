require_relative 'instance_counter.rb'
require_relative 'validate.rb'
class Station
  include InstanceCounter
  include Validate
  @@all = []
  attr_reader :name, 
              :trains_on_station
  def initialize(name)
    @@all.push(self)
    @name = name  
    @trains_on_station = []
    validate!
    #register_instance
  end
  def add_trains (train)
    @trains_on_station << train
  end
  def del_trains (train)
    trains_on_station.delete(train)
  end
  def show_trains
    @trains_on_station.each { |train| puts train.name }
  end
  def return_type(type)
    count_of_type = @trains_on_station.select { |train| train.type == type }
    count_of_type.count
  end
  def self.all
    @@all
  end
  def each_train(&block)
    raise "Поезда на станции #{name} отсутствуют." if @trains_on_station.empty?
    @trains_on_station.each { |train| block.call(train) } if block_given?
  end
  protected
  def validate!
    raise "Название не может быть пустым" if name.empty?
    raise "Номер не может иметь длину больше 15 символов" if name.length > 15
    true
  end
end
