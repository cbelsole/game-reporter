class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_or_guest_user, :guest_user

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    current_user || guest_user
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id]) if session[:guest_user_id]

  # rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
  #    session[:guest_user_id] = nil
  #    guest_user if with_retry
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
  end

  def create_or_merge_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        # reload guest_user to prevent caching problems before destruction
        guest_user.reload.try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      u = User.create(
        name: params[:guest],
        email: "guest_#{Time.now.to_i}#{rand(100)}@example.com",
        guest: true
      )
      u.save!(validate: false)
      session[:guest_user_id] = u.id
      u
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.host?
        new_game_path
      elsif resource.player?
        find_games_path
      else
        root_path
      end
    else
      super
    end
  end
end
