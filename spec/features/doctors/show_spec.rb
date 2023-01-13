require 'rails_helper'

RSpec.describe 'the doctor show' do
  before(:each) do
    @doctor_1 = create(:doctor)

    @hospital_1 = create(:hospital)

    @patient_1 = create(:patient)
  end

  describe 'As a visitor to a doctor\'s show page' do
    it 'shows all attributes for doctor; name, specialty, university' do
      visit doctor_path(@doctor_1)

      expect(page).to have_content()
    end
  end
end