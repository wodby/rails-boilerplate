class HomeController < ApplicationController
  def index
    render json: { message: "Hello from Wodby Rails" }
  end
end
