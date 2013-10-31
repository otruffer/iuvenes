class HomeController < ApplicationController
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def index
  end

  def toggle_root
    if !Rails.env.procduction? then
      current_user.root = !current_user.root
      current_user.save!
    end
    redirect_to root_path
  end

  def toggle_admin
    if !Rails.env.procduction? then
      current_user.admin =!current_user.admin
      current_user.save!
    end
    redirect_to root_path
  end

  # For all responses in this controller, return the CORS access control headers.

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

end
