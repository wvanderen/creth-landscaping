require 'random_data'

5.times do 
    User.create!(
        email: Faker::Internet.unique.email,
        password: "pa$$w0rd"
        )
    end
    users = User.all

50.times do
    job = Job.create!(
        user: users.sample,
        address: (Faker::Address.street_address + Faker::Address.zip),
        yardsize: rand(100..5000),
        date: Faker::Date.forward(40),
        specialrequests: Faker::HarryPotter.quote,
        stripes: Faker::Boolean.boolean,
        grasstreated: Faker::Boolean.boolean,
        mulching: Faker::Boolean.boolean,
        mulchexisting: Faker::Boolean.boolean,
        newbushestrees: Faker::Boolean.boolean,
        rate: rand(50..500),
        status: rand(0..2),
        paid: Faker::Boolean.boolean,
        notes: Faker::HarryPotter.character
        )
        
        job.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

jobs = Job.all



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Job.count} jobs created"
