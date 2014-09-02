class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  validates :steam_name, uniqueness: true

  before_save :set_steam_data

  def set_steam_data
    if steam_id.blank? || avatar.blank?
      response = HTTParty.get("http://steamcommunity.com/id/#{steam_name}/?xml=1").parsed_response
      if response['profile'].present? 
        self.steam_id = response['profile']['steamID64']
        self.avatar = response['profile']['avatarFull']
      else
        false
      end
    end
  end
end
