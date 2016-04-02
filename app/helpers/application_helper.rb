module ApplicationHelper

  def header_logo_link(user)
    if user.try(:host?)
      games_path
    elsif user.try(:player?)
      find_games_path
    else
      root_path
    end
  end

end
