at_email = "@regalii.com"
password = "secret123"

['inigo', 'edrizio'].each do |u|
  User.create!(email: "#{u}@regalii.com", password: 'secret123')
end

10.times do |i|
  User.create!(email: "user#{i}#{at_email}", password: password)
end
puts "-- Added 12 users to your database"

20.times do
  user_id = User.all.sample.id
  opponent_ids = User.all.map(&:id).reject{|id| id == user_id}
  Game.create!(
    date_played: Date.today - Random.rand(10).days,
    opponent_id: opponent_ids.sample,
    user_id: user_id,
    user_score: Random.rand(22),
    opponent_score: Random.rand(22)
  )
end
puts "-- Added 20 games to your database"


