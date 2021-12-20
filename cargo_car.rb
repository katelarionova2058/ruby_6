class CargoCar < Car
  def initialize(number, volume)
  	@number = number
    @type = :cargo
    @init_vol = volume.to_i
    @volume = volume.to_i
    validate!
  end
  def filling_the_car
    @volume = @volume - 1 if @volume > 0
  end
  def engaged
    @init_vol - @volume
  end 
end
