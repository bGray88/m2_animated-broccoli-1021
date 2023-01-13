require 'rails_helper'

RSpec.describe 'the doctor show' do
  before(:each) do
    @hospital_1 = create(:hospital)

    @doctor_1 = create(:doctor, hospital: @hospital_1)

    @patient_1 = create(:patient)
  end

  describe 'As a visitor to a doctor\'s show page' do
    it 'shows all attributes for doctor; name, specialty, university' do
      visit doctor_path(@doctor_1)

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)
    end
  end
end