class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    create_or_merge_guest_user
  end
end
