require 'elo'

class RatingCalculator

  def self.ratings_after_game(game)
    user = Elo::Player.new(rating: game.user.rating)
    opponent = Elo::Player.new(rating: game.opponent.rating)
    if game.draw?
      user.plays_draw(opponent)
    elsif game.win?
      user.wins_from(opponent)
    else
      user.loses_from(opponent)
    end
    {user: user.rating, opponent: opponent.rating}
  end

end
