class ApplicationController < ActionController::Base
  def hello
    render json: "Hello, world!"
  end
end
