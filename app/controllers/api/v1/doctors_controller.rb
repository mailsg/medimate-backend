class Api::V1::DoctorsController < ApplicationController
  def index
    current_user
    render json: Doctor.all
  end
end
