class Train
  attr_reader :speed, :wagon, :type, :station

  def initialize(number, type)
    @number = number
    @type = type
    @train = { number => type }
    @wagon = 0
    @speed = 0
  end

  def type
    puts "Поезд №#{@number} типа #{@type}"
  end

  def speed
    puts puts "Поезд №#{@number} имеет скорость #{@speed}"
  end

  def speed_up
    @speed += 20
    if @speed == 0
      puts "Поезд №#{@number} тронулся и движется со скоростью #{@speed} км/ч."
    else
      puts "Поезд №#{@number} ускорился, теперь его скорость составляет #{@speed} км/ч."
    end
  end

  def stop
    if @speed == 0
      puts "Поезд №#{@number} и так стоит."
    else
      @speed = 0
      puts "Поезд №#{@number} остановлен."
    end
  end
  
  def add_wagon
    if @speed == 0
      @wagon += 1
    else
      puts "Состав движется, прицепить вагон нельзя"
    end
  end

  def delete_wagon
    if @wagon == 0
      puts "Состав без вагонов"
    elsif @speed > 0
      puts "Состав движется, отцепить вагон нельзя"
    else
      @wagon -= 1
      puts "Вагон успешно отцеплен."
    end
  end

  def take_route(route)
    @station = station
    puts "Поезд №#{@number} готов ехать с станции #{@station.first} на станцию #{@station.last}"
  end

  def move(station)
    if @route.include?(station)
      @station = station
      puts "Поезд №#{@number} приехал на с станцию #{@station}"
    else
      puts "Такой станции нет в маршруте"
    end
  end

  def list
    return {@number => @type}
  end
end

class RailwayStation
  def initialize(name)
    @name = name
    @trains = {}
    puts "Станция #{@name} создана"
  end

  def list
    puts "На станции сейчас #{@trains.length} поездов."
  end

  def list_type
    puts "Грузовых поездов на станции: #{count_hash_dublicate(@trains, "freight")}"
    puts "Пассажирских поездов на станции: #{count_hash_dublicate(@trains, "passenger")}"
  end
  
  def take_train(train = {})
    @number = train.keys.join
    @type   = train.values.join
    if @number.nil? || @type.nil?
      puts "Невозможно принять такой поезд"
    else
      @trains[@number] = @type
      puts "Поезд с номером #{@number} и типом #{@type} принят на станцию"
    end
  end

  def send_train(train = {})
    @number = train.keys.join
    @type   = train.values.join
    if @trains.include?({@number => @type})
      @trains.delete({@number => @type})
      puts "Поезд Номер: #{@number} покинул станцию"
    else
      puts "На станции нет такого поезда"
    end
  end

private
  def count_hash_dublicate(hash, value)
    count = 0
    hash.values.each do |t|
      if t == value
        count += 1
      end
    end
    return count
  end
end

class Route
  attr_accessor :route

  def initialize(stations = [])
    if stations.size >= 2
      @stations = stations
      puts "Маршрут #{@stations.first} - #{@stations.last} создан"
    else
      puts "В маршруте мало станций"
    end
  end

  def start_route
    puts "Первая станция данного маршрута #{@stations[0]}"
  end

  def end_route
    puts "Последняя станция данного маршрута #{@stations[-1]}"
  end

  def middle_route
    puts "Промежуточные станции данного маршрута #{@stations[1..-2]}"
  end

  def add(station)
    @stations.insert(-2, station)
    puts "Новая станция (#{station}) добавлена в маршрут"
  end

  def delete(station)
    if @stations.include?(station)
      @stations.delete(station)
      puts "Станция #{station} удалена из маршрута"
    else
      puts "Станции #{station} станции нет в маршруте"
    end
  end

  def list
    puts "Маршрут от #{@stations.first} до #{@stations.last}"
    @stations.each_with_index{ |station, index| puts "#{index + 1}. #{station}"}
  end

  def stations
    @stations
  end
end