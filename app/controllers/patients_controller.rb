class PatientsController < ApplicationController
  def index
    @patients = Patient.alpha_sort_name
  end
end