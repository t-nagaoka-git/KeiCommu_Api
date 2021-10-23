json.result @result
json.status @status
json.message @message
json.total @total
json.teams @teams do |team|
  json.id team.id
  json.name team.name
  json.description team.description
  json.visibility_setting team.visibility_setting
  json.gender_restriction team.gender_restriction
  json.auto_exit_grace_period team.auto_exit_grace_period
  json.created_at team.created_at
  json.updated_at team.updated_at
  json.users do
    json.array! team.users, :id, :name, :image
  end
end