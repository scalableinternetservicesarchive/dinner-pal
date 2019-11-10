class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user!

  def ensure_admin_user!
    puts 'ensuring admin user'
    unless current_user and current_user.admin?
      redirect_to root_path, alert: 'You do not have permission to access this page.'
    end
  end
end
