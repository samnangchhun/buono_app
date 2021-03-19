require 'open-uri'
require 'json'

class Fetch
  def self.fetch_recipe(id)
    apikey = "c230327f3f7043b1b2990425b5e59e12"
    url = "https://api.spoonacular.com/recipes/#{id}/information?apiKey=#{apikey}&includeNutrition=false"
    p url
    json = open(url).read
    json_parsed = JSON.parse(json)
    save_json(json_parsed, id)
  end

  private

  def self.save_json(json, id)
    filepath = "db/jsons/recipes/recipe_#{id}.json"
    File.open(filepath, 'wb') { |file| file.write(JSON.generate(json)) }
  end
end
