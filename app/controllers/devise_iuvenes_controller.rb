class DeviseIuvenesController < Devise::SessionsController
    protect_from_forgery :except => [:new, :create]
end