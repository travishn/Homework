class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    cups.each_with_index do |el, idx|
      unless idx == 6 || idx == cups.length - 1
        4.times do |n|
          el << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(1,12)
      raise "Invalid starting cup"
    end

    true
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []

    idx = start_pos
    until stones.empty?
      idx = (idx+1) % 14 #ensures we never go passed given mancala slots

      next if idx == 6 && current_player_name == @name2
      next if idx == 13 && current_player_name == @name1
      cups[idx] << stones.pop
    end

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move return
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    elsif cups[ending_cup_idx].length > 1
      ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all? { |cup| cup.empty? }
    return true if cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    case cups[13].length <=> cups[6].length
    when -1
      @name1
    when 0
      :draw
    when 1
      @name2
    end
  end
end
