class Game < ActiveRecord::Base

  belongs_to :user

  belongs_to :opponent, class_name: "User"

  validates :date_played, presence: true
  validates :user_score, presence: true
  validates :opponent_score, presence: true

  after_create :update_players_ratings

  def score
    "#{user_score} - #{opponent_score}"
  end

  def result
    return "D" if draw?
    win? ? "W" : "L"
  end

  def win?
    user_score > opponent_score
  end

  def draw?
    user_score == opponent_score
  end

  private

  def update_players_ratings
    new_ratings = RatingCalculator.ratings_after_game(self)
    user.update_attributes(rating: new_ratings[:user])
    opponent.update_attributes(rating: new_ratings[:opponent])
  end

end
