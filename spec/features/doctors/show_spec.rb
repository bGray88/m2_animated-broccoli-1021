require 'rails_helper'

RSpec.describe 'the doctor show' do
  before(:each) do
    @hospital_1 = create(:hospital)

    @doctor_1 = create(:doctor, hospital: @hospital_1)
    @doctor_2 = create(:doctor, hospital: @hospital_1)

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

  describe 'As a visitor to a doctor\'s show page' do
    it 'shows all attributes for doctor; name, specialty, university' do
      visit doctor_path(@doctor_1)

      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.specialty)
      expect(page).to have_content(@doctor_1.university)
    end

    it 'shows the name of associated hospital and names of all patients' do
      visit doctor_path(@doctor_1)

      expect(page).to have_content(@doctor_1.hospital.name)
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_3.name)
      expect(page).to have_content(@patient_4.name)
      expect(page).to_not have_content(@patient_5.name)
    end

    describe 'Next to each patient\'s name, has a button to remove that patient from that doctor' do
      describe 'When I click that button for one patient I\'m brought back to the doctor show page' do
        describe 'And I no longer see that patient\'s name listed, when I visit a different doctor\'s show page that is caring for the same patient' do
          it 'shows that the patient is still on the other doctor\'s caseload' do
            visit doctor_path(@doctor_1)
            
            within("#doctor-patient-#{@patient_1.id}") do
              expect(page).to have_content(@patient_1.name)

              click_on("Delete Patient")
            end

            expect(page).to_not have_content(@patient_1.name)

            visit doctor_path(@doctor_2)

            within("#doctor-patient-#{@patient_1.id}") do
              expect(page).to have_content(@patient_1.name)
            end
          end
        end
      end
    end
  end
end