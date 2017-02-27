module ApplicationHelper

  def result_row_style_class(game)
    game.win? ? "success" : "danger"
  end

  def current_user_leaderboard_row_class(user)
    user.id == current_user.id ? "info" : ""
  end
end
