module ApplicationHelper

  def default_user_path(user)
    if user.try(:host?)
      games_path
    elsif user.try(:player?)
      find_games_path
    else
      root_path
    end
  end

end
