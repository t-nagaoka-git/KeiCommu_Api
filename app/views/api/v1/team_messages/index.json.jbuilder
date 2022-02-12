json.result @result
json.status @status
json.message @message
json.total @total
json.team_messages @team_messages do |team_message|
  json.id team_message.id
  json.content team_message.content
  json.created_at team_message.created_at
  json.user do
    json.id team_message.user.id
    json.name team_message.user.name
    json.image team_message.user.image
  end
end