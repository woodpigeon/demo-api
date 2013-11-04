class ApiController < ActionController::Base
  protect_from_forgery
  respond_to :json
  # no auth!!
  
end
