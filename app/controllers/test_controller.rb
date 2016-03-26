class TestController < ActionController::API

  def test
    render json: {test: "test"}
  end

end
