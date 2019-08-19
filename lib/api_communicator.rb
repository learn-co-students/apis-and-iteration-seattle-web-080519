require 'rest-client'
require 'json'
require 'pry'
$v = ""
def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
  response_hash = JSON.parse(response_string)
  # binding.pry
  if response_hash["count"] == 0
    $v = "bleh"
    puts "no name exist in the star wars universe try again"
  else
    return response_hash["results"][0]["films"].map {|e| JSON.parse(RestClient.get(e))}
  end
 
  #  p response_hash.map do |k,v|
  #     if v.class == Array
  #       v.each do |e|
  #         if e["name"] == character_name
  #           e["films"].each do |film|
  #             films << film
  #           end
  #         end
  #       end
  #     end
  #   end
    # films
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  if $v == "bleh"
    puts "please input a starwars character name"
  else
  films.each {|e| puts e["title"]} 
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
  # binding.pryd
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
