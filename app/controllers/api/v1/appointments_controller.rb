class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[show update destroy]

  # GET /api/v1/appointments
  def index
    @appointments = current_user.appointments
    render json: @appointments
  end

  # GET /api/v1/appointments/:id
  def show
    render json: @appointment
  end

  # POST /api/v1/appointments
  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/appointments/:id
  def update
    @appointment = current_user.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      render json: { result: 'Appointment updated successfully' }
    else
      render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/appointments/:id
  def destroy
    @appointment = current_user.appointments.find(params[:id])
    @appointment.destroy
    render json: { result: 'Appointment deleted successfully' }
  end

  private

  def set_appointment
    @appointment = current_user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :duration, :doctor_id)
  end
end
