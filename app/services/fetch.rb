require 'open-uri'
require 'json'

class Fetch
  def self.fetch(url, id, folder)
    json = open(url).read
    json_parsed = JSON.parse(json)
    save_json(json_parsed, id, folder)
  end

  private

  def self.save_json(json, id, folder)
    filepath = "db/jsons/#{folder}/recipe_#{id}_#{folder}.json"
    File.open(filepath, 'wb') { |file| file.write(JSON.generate(json)) }
  end
end
