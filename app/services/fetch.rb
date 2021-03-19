require 'open-uri'
require 'json'

class Fetch
  def self.fetch(url, id, folder)
    json = open(url).read
    save_json(json, id, folder)
  end

  private

  def self.save_json(json, id, folder)
    filepath = "db/jsons/#{folder}/recipe_#{id}_#{folder}.json"
    File.open(filepath, 'wb') { |file| file.write(json) }
  end
end

# filepath = "db/jsons/#{folder}/recipe_#{id}_#{folder}.json"
# filepath = "db/jsons/#{folder}_#{id}.json"
