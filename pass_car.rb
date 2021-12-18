class PassCar < Car

  def initialize(number, place_cnt)
    @number = number
    @type = :pass
    @init_place_cnt = place_cnt
    @place_cnt = place_cnt
    validate!
  end

  def take_place(train_get, number_get)
    search_of_train = @trains.bsearch { |train| train.name == train_get}
    search_of_num = search_of_train.cars.bsearch { |car| car.number == number_get }
    search_of_num.place_cnt = search_of_num.place_cnt - 1 if search_of_num.place_cnt > 0
  end

  def engaged
    engaged = @init_place_cnt - @place_cnt
    return engaged
  end

  def free
    return place_cnt
  end
  
end
