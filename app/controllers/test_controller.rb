class TestController < ApplicationController
  def index
    render json: { message: "success" }
  end
end
