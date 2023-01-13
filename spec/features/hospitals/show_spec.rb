require 'rails_helper'

RSpec.describe 'the hospital show' do
  before(:each) do
    @hospital_1 = create(:hospital)
    @hospital_2 = create(:hospital)

    @doctor_1 = create(:doctor, hospital: @hospital_1)
    @doctor_2 = create(:doctor, hospital: @hospital_1)
    @doctor_3 = create(:doctor, hospital: @hospital_1)
    @doctor_4 = create(:doctor, hospital: @hospital_2)

    @patient_1 = create(:patient)
    @patient_2 = create(:patient)
    @patient_3 = create(:patient)
    @patient_4 = create(:patient)
    @patient_5 = create(:patient)

    @doctor_1.patients << @patient_1
    @doctor_1.patients << @patient_2
    @doctor_1.patients << @patient_3
    @doctor_1.patients << @patient_4
    @doctor_2.patients << @patient_5
    @doctor_2.patients << @patient_1
  end

  describe 'As a visitor to a hospital\'s show page' do
    it 'I see the hospital\'s name and the names of all doctors that work at this hospital' do
      visit hospital_path(@hospital_1)

      expect(page).to have_content(@hospital_1.name)
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_2.name)
      expect(page).to have_content(@doctor_3.name)
      expect(page).to_not have_content(@doctor_4.name)
    end
  end
end