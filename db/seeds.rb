require 'random_data'

5.times do 
    User.create!(
        email: Faker::Internet.unique.email,
        password: "pa$$w0rd"
        )
    end
    users = User.all

50.times do
    wiki = Wiki.create!(
        user: users.sample,
        title: (Faker::GameOfThrones.character + Faker::GameOfThrones.dragon),
        body: (Faker::RickAndMorty.quote + Faker::RickAndMorty.character)
        )
        
        wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

wikis = Wiki.all


Wiki.find_or_create_by(
    title: "Unique Title",
    body: "Unique Body"
    )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
