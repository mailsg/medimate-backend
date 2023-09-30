class Api::V1::DoctorsController < ApplicationController
  def index
    current_user
    render json: Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
    render json: @doctor
  end

  def create
    @user = current_user
    @doctor = user.doctors.build(doctor_params)
    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = current_user
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
    params.require(:doctor).permit(:name, :time_available_from, :time_available_to, :bio, :fee_per_appointment, :specialization_id, :image, :user_id)
  end

end
