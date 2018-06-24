class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1)
    @sequence_length = sequence_length
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    if game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence

    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    
  end

  def add_random_color
    seq.push(COLORS.sample)
  end

  def round_success_message
    "Congrats you've completed a successful round of Simon!"
  end

  def game_over_message
    "The game is over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
