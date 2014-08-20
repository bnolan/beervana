json.users @users do |user|
  json.id user.id
  json.name user.name
  json.standard_drinks user.standard_drinks
end