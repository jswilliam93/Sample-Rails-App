User.create(name: "Joe",
            email: "jswilliam93@gmail.com",
            password: "123456",
            password_confirmation: "123456",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)
99.times do |n|
  name = Faker::Name.name
  email = "example#{n+1}@mail.com"
  password = "password"
  User.create(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
