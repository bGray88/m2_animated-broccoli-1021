class DoctorPatientsController < ApplicationController
  def destroy
    @doctor_patient = DoctorPatient.find_by(patient_id: params[:doctor_id], doctor_id: params[:id])
    DoctorPatient.delete(@doctor_patient)

    redirect_to doctor_path(params[:id])
  end
end