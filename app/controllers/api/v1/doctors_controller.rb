class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  skip_authorize_resource only: %i[index show]

  def index
    render json: Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
    render json: @doctor
  end

  def create
    @doctor = user.doctors.build(doctor_params)
    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @doctors = Doctor.all
    @doctor = Doctor.find(params[:id])
    if user.id == @doctor.user_id
      @doctor.destroy
      render json: @doctors
    else
      render json: { error: 'You cannot proceed with this operation' }, status: :unprocessable_entity
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :time_available_from, :time_available_to, :bio, :fee_per_appointment,
                                   :specialization_id, :image, :user_id)
  end
end
