json.array!(@games) do |game|
  json.extract! game, :id, :appid, :name, :playtime_forever, :icon_url, :logo_url, :has_community_visible_stats
  json.url game_url(game, format: :json)
end
