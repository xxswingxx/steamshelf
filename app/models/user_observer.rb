class UserObserver < ActiveRecord::Observer

  def after_create
    "http://steamcommunity.com/id/#{username}/?xml=1"
    RetrieveGameJob.new.async.perform()
  end
end