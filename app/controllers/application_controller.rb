class ApplicationController < ActionController::API

  rescue_from 'Exceptions::BadRequest' do |exception|
    render json: exception, status: 400
  end

end
