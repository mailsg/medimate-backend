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
    render json: @appointment, status: :ok
  end

  # POST /api/v1/appointments
  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: { errors: @appointment.errors.full_messages, status: 'Failed' }, status: :unprocessable_entity
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
    if @appointment.destroy
      render json: { data: 'Appointment deleted successfully', status: 'Success' }, status: :ok
    else
      render json: { data: 'Something went wrong', status: 'Failed' }
    end
  end

  private

  def set_appointment
    @appointment = current_user.appointments.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :unauthorized
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :duration, :doctor_id)
  end
end
