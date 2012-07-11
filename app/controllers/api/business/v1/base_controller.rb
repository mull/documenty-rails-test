class Api::Business::V1::BaseController < ActionController::Base
  respond_to :json
  before_filter :authenticate_user!
  before_filter :get_business

  def get_business
    @business = current_user.business    
  end
end
