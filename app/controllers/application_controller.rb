class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.admin?
        root_paths
      elsif resource.host?
        new_game_path
      elsif resource.player?
        find_games_path
      end
    else
      super
    end
  end
end
