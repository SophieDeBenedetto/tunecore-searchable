# TuneCore Searchable

A Rails implementation of a fuzzy search for songs by any combination of song title, artist name, album title and keyword. 

## Get It Up and Running

* git clone
* `rake db: create; rake db:migrate; rake db:seed`
* Run it! `rails s`

## View It

* check out a deployed version of this app [here](https://tunecore-challenge.herokuapp.com/)

## Technologies

* Postgresql database stores songs and their associated artists and albums.
* Database seeded by parsing JSON files stored in `db/fixtures`. JSON files populated with Spotify API response data.
* Search feature implemented with AJAX and Active Record queries leveraging the `joins` method to execute SQL queries on associated data.
* Search feature sends search request via AJAX, renders responds with a `.js.erb` view file. For pure client-side implementation using jBuilder to render JSON, see [this branch](https://github.com/SophieDeBenedetto/tunecore-searchable/tree/results-with-ajax-success-function). For pure client-side implementation using Active Model Serializers to render JSON, see [this branch](https://github.com/SophieDeBenedetto/tunecore-searchable/tree/results-with-ajax-success-function-active-model-serializer).
* Search feature uses Active Job, with the SideKiq adapter, backed by Redis in production, to execute search against database. 
* Search methods are wrapped in a `Search` service class, found in `app/servics/search.rb`.
* Responsive UI implemented with Bootstrap and Bootswatch.
* RSpec tests for models and job; RSpec + Capybara for feature testing of search functionality. 