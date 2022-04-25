json.result @result
json.status @status
json.message @message
json.team do
  json.merge! @team.attributes
  json.users do
    json.array! @team.users, :id, :name, :image
  end
end