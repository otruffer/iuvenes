class DeviseIuvenesController < Devise::SessionsController
  #we dont want protect from forgery for login, so the app can log in.
    protect_from_forgery :except => [:new, :create]

    # POST /resource/sign_in
    def create
      respond_to do |format|
        format.html {
          self.resource = warden.authenticate!(auth_options)
          set_flash_message(:notice, :signed_in)## if is_flashing_format?
          sign_in(resource_name, resource)
          yield resource if block_given?
          respond_with resource, :location => after_sign_in_path_for(resource)
        }
        format.json {
          self.resource = warden.authenticate!({ :scope => resource_name})
          #sign_in(resource_name, resource)
          #yield resource if block_given?
          #respond_with resource, :location => after_sign_in_path_for(resource)
          render :json => self.resource
        }
      end
    end
end