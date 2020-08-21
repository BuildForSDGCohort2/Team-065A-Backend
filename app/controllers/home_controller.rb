class HomeController < ApplicationController
  def index
    render json: {welcome: "Welcome to the API of Team-065-A App!"}
  end
end
