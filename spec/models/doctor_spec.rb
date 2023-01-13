require 'rails_helper'

RSpec.describe Doctor do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end

  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe 'instance methods' do
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

    describe '#patient_count' do
      expect(@doctor_1.patient_count).to eq(4)
    end
  end
end
