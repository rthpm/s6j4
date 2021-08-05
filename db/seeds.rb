require 'faker'

10.times do
  City.create!(name: Faker::Address.city,
               zip_code: Faker::Address.zip_code)
end

10.times do
  otp = Faker::Internet.password(min_length: 8, max_length: 20)
  User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               email: Faker::Internet.email,
               age: rand(18..98),
               description: Faker::Lorem.paragraph,
               city: City.all.sample,
               password: otp,
               password_confirmation: otp)
end

100.times do
  Gossip.create!(title: Faker::Book.title[0..13],
                 content: Faker::Lorem.paragraph(sentence_count: 10),
                 user: User.all.sample)
end

200.times do
  Comment.create!(content: Faker::Lorem.paragraph,
                  gossip: Gossip.all.sample,
                  user: User.all.sample)
end

400.times do
  Like.create!(
    gossip: Gossip.all.sample,
    user: User.all.sample
  )
end

400.times do
  Like.create!(
    comment: Comment.all.sample,
    user: User.all.sample
  )
end
