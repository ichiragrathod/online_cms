class DashboardController < ApplicationController
  before_action :authenticate_user!, :require_user
  def index
  end
end
