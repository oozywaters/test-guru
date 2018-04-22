class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :restrict_users

  layout 'admin'

  private

  def restrict_users
    redirect_to root_path unless current_user.admin?
  end
end
