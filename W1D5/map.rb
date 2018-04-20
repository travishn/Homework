class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = nil
    map.each_with_index do |el, idx|
      pair_index = idx if map[idx][0] == key
      break
    end

    if pair_index
      map[pair_index] = [key, value]
    else
      map << [key, value]
    end
  end

  def lookup(key)
    map.each do |pair|
      return pair[1] if pair[0] == key
    end
  end

  def remove(key)
    map.reject! { |pair| pair[0] == key }
  end

  def show
    @map
  end
end

if __FILE__ == $PROGRAM_NAME
  test = Map.new
  test.assign("a", 1)
  test.assign("b", 2)
end
