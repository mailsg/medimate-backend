class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: %i[show update destroy]

  # GET /api/v1/doctors
  def index
    @doctors = current_user.doctors.includes(:specialization)
    render json: @doctors.to_json(include: :specialization)
  end

  # GET /api/v1/doctors/:id
  def show
    # @doctor = Doctor.find(params[:id])
    @doctor = Doctor.includes(:specialization).find(params[:id])
    render json: @doctor.to_json(include: :specialization)
  end

  # POST /api/v1/doctors
  def create
    @doctor = current_user.doctors.build(doctor_params)
    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: { errors: @doctor.errors.full_messages, status: 'Failed' }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/doctors/:id
  def update
    @doctor = current_user.doctors.find(params[:id])
    if @doctor.update(doctor_params)
      render json: { result: 'Doctor updated successfully' }
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/doctors/:id
  def destroy
    @doctor = current_user.doctors.find(params[:id])
    if @doctor.destroy
      render json: { data: 'Doctor deleted successfully', status: 'Success' }, status: :ok
    else
      render json: { error: 'You cannot proceed with this operation' }, status: :unprocessable_entity
    end
  end

  private

  def set_doctor
    @doctor = current_user.doctors.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :unauthorized
  end

  def doctor_params
    params.require(:doctor).permit(:name, :time_available_from, :time_available_to, :bio, :fee_per_appointment,
                                   :specialization_id, :image, :location)
  end
end
