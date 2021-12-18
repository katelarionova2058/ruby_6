class CargoCar < Car

  def initialize(number, volume)
  	@number = number
    @type = :cargo
    @init_vol = volume
    @volume = volume
    validate!
  end

  def take_place(train_get, number_get)
    search_of_train = @trains.bsearch { |train| train.name == train_get}
    search_of_num = search_of_train.cars.bsearch { |car| car.number == number_get }
    search_of_num.volume = search_of_num.volume - 1 if search_of_num.volume > 0
  end

  def engaged
    engaged = @init_vol - @volume
    return engaged
  end

  def free
    return volume
  end
  
end
