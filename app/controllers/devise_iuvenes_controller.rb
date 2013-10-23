class DeviseIuvenesController < Devise::SessionsController
  #we dont want protect from forgery for login, so the app can log in.
    protect_from_forgery :except => [:new, :create]
end