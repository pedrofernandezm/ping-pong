class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :games

  def username
    email.split("@").first
  end

  def opponents
    @opponents ||= User.where.not(id: id)
  end

  def games_played
    @games_played ||= Game.where("user_id = ? OR opponent_id = ?", id, id).count
  end

end
