class DashboardController < ApplicationController
  before_action :authenticate_session
  before_action { active_sidebar(:dashboard) }

  def index
    active_sidebar(:dashboard)
  end

  def configuration
    active_sidebar(:configuration)
  end
end
