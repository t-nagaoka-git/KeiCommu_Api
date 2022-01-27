json.result @result
json.status @status
json.message @message
json.total @total
json.users @users do |user|
  json.extract! user, :id, :name, :image, :email, :gender, :description
  json.following current_api_v1_user.following?(user)
end