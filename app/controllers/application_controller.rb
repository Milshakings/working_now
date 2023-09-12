class ApplicationController < ActionController::Base
    protect_from_forgery with:  :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone,  images_attributes: [:url,
    :context, :id]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone e, images_attributes:
    [:url, :context, :id]])
    end
   

    def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
