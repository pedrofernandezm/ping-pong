class GamesController < ApplicationController

  def index
    @games = current_user.games.includes(:opponent).order(date_played: :desc, created_at: :desc)
  end

  def new
    @game = current_user.games.new
    @opponents = current_user.opponents
  end

  def create
    @game = current_user.games.new(game_params)
    if @game.save
      redirect_to games_path
    else
      @opponents = current_user.opponents
      render :new
    end
  end

  private

  def game_params
    params[:game].permit(:date_played, :opponent_id, :user_score, :opponent_score)
  end
end
