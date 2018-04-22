class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "Try to memorize this color sequence: #{seq} in 5 seconds."
    sleep(5)
    system("clear")

    sequence_length.times do |idx|
      puts "What is color #{idx+1} in the sequence?"
      guess = gets.chomp.downcase
      @game_over = true unless seq[idx] == guess

      if game_over
        puts "The color was #{seq[idx]}."
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Congratulations! Let's move onto the next round"
  end

  def game_over_message
    puts "Wrong color sequence. Better luck next time!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  test = Simon.new
  test.play
end
