json.result @result
json.status @status
json.message @message
json.total @total
json.microposts @microposts do |micropost|
  json.id micropost.id
  json.content micropost.content
  json.image micropost.image
  json.liked @liked_micropost_ids.include?(micropost.id)
  json.created_at micropost.created_at
  json.updated_at micropost.updated_at
  json.user do
    json.id micropost.user.id
    json.name micropost.user.name
    json.image micropost.user.image
  end
end