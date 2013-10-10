class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Include the sessions controller helper module so
  # that all of the helpers are available in every
  # controller and view. By default, all helpers are
  # available in every view, but not in the controllers.
  include SessionsHelper
end
