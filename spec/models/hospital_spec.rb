require 'rails_helper'

RSpec.describe Hospital do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :doctors}
  end
end
