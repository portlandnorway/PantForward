class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def layout_by_resource
    if devise_controller?
      "no_navbar_layout"
    else
      "application"
    end
  end
end
