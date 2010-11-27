class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  layout :layout_by_resource

  def set_locale
    I18n.locale = :nl #FIXME
  end

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
