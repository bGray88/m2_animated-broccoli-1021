require 'rails_helper'

RSpec.describe 'the patients index' do
  before(:each) do
    @patient_1 = create(:patient, age: 94, name: "Billy")
    @patient_2 = create(:patient, age: 10)
    @patient_3 = create(:patient, age: 56, name: "Penelope")
    @patient_4 = create(:patient, age: 42, name: "Jimmy")
    @patient_5 = create(:patient, age: 5)
    @patient_6 = create(:patient, age: 22, name: "Qix")
  end

  describe 'When I visit the patient index page' do
    describe 'I see the names of all adult patients (age is greater than 18)' do
      it 'lists the names in ascending alphabetical order (A - Z, you do not need to account for capitalization)' do
        visit patients_path

        expect(page).to have_content(@patient_1.name)
        expect(page).to have_content(@patient_3.name)
        expect(page).to have_content(@patient_4.name)
        expect(page).to have_content(@patient_6.name)

        expect(@patient_1.name).to appear_before(@patient_4.name)
        expect(@patient_4.name).to appear_before(@patient_3.name)
        expect(@patient_3.name).to appear_before(@patient_6.name)

        @patient_7 = create(:patient, age: 37, name: "Chet")

        visit patients_path

        expect(@patient_7.name).to appear_before(@patient_4.name)
      end
    end
  end
end