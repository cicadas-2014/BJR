User.create( username: "admin",
             password: "admin",
             funds: 9000 )

8.times do |n|
  Racer.create( max_steps: n+1,
                 odds: 0 )
end
