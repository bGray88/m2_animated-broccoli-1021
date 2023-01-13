require 'rails_helper'

RSpec.describe Patient do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'instance methods' do
    before(:each) do
      @patient_1 = create(:patient, age: 94, name: "Billy")
      @patient_2 = create(:patient, age: 10)
      @patient_3 = create(:patient, age: 56, name: "Penelope")
      @patient_4 = create(:patient, age: 42, name: "Jimmy")
      @patient_5 = create(:patient, age: 5)
      @patient_6 = create(:patient, age: 22, name: "Qix")
    end

    describe '#alpha_sort_name' do
      it 'returns a set of patients based on (age > 18 and name sorted asc)' do
        expect(Patient.alpha_sort_name).to eq([@patient_1, @patient_4, @patient_3, @patient_6])
      end
    end
  end
end
