json.result @result
json.status @status
json.message @message
json.team_message do
  json.id @team_message.id
  json.content @team_message.content
  json.created_at @team_message.created_at
  json.user do
    json.id @team_message.user.id
    json.name @team_message.user.name
    json.image @team_message.user.image
  end
end