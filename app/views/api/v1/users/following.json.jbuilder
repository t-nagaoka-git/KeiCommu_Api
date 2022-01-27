json.result @result
json.status @status
json.message @message
json.total @total
json.users @users do |user|
  json.extract! user, :id, :name, :image, :email, :gender, :description
  json.following true
end