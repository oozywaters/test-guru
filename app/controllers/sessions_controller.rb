class SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:notice, :signed_in_greeting, fullname: current_user.fullname)
  end
end
