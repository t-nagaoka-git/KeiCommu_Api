json.result @result
json.status @status
json.message @message
json.user do
  json.extract! @user, :id, :name, :image, :email, :gender, :description
  json.following @following
  json.friends_count @friends_count
  json.followers_count @followers_count
end