class HomeController < ApplicationController
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
end
