require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
    all_chars = RestClient.get('http://www.swapi.co/api/people/')
    all_chars_hash = JSON.parse(all_chars)
  #select character
    character_data = all_chars_hash["results"].find{|result| result["name"] == character_name}
    #map character films & flatten nested array
    data_urls = character_data["films"]
    parsed_data = data_urls.collect{|data| JSON.parse(RestClient.get(data))}
    parsed_data
  end 
  

  
  

# web_request = films.map{|film| JSON.pars(RestClient.get("#{films[i]"))}


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`x
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
def print_movies(films)
  #films = get_character_movies_from_api("Luke Skywalker")
  films.map{|x| x["title"]}
end

puts print_movies(get_character_movies_from_api("Darth Vader"))

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

puts show_character_movies("Darth Vader")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

