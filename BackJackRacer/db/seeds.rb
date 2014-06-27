User.create( username: "admin",
             password: "admin" )

8.times do |n|
  Racer.create( max_steps: n,
                 odds: 0 )
end
