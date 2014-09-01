class UserObserver < ActiveRecord::Observer

  def after_create(user)
  	response = HTTParty.get("http://steamcommunity.com/id/#{user.steam_name}/?xml=1").parsed_response
  	user.update_column(:steam_id, response['profile']['steamID64']) if response['profile'].present?
  end
end