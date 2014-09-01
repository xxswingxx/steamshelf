class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  validates :steam_name, uniqueness: true

  before_save :set_steam_id

  def set_steam_id
    if steam_id.blank?
      response = HTTParty.get("http://steamcommunity.com/id/#{steam_name}/?xml=1").parsed_response
      if response['profile'].present? 
        self.steam_id = response['profile']['steamID64']
      else
        false
      end
    end
  end
end
