json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :password_digest, :nickname, :phone_num, :email, :address, :mission, :is_family
  json.url user_url(user, format: :json)
end
