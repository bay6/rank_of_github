# User Whenever to update china users data

set :output, "./log/whenever.log"

every 1.days do
  runner "User.fetch_china_users"
end
