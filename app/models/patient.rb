class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  validates_presence_of :name, :age

  def self.alpha_sort_name
    self.where('age > 18').order(name: :asc)
  end
end
