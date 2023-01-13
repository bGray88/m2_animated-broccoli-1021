FactoryBot.define do
  factory :doctor do
    name {Faker::Name.name}
    specialty {Job.key_skill}
    university {Faker::University.name}
  end

  factory :hospital do
    name {Faker::Bible.location}
    bachelorette
  end

  factory :patient do
    name {Faker::Name.name}
    age {rand(5..75)}
  end
end
