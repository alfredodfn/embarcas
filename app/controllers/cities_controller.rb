# frozen_string_literal: true

class CitiesController < ApplicationController
  def index
    @cities = params[:query].present? ? City.search(params[:query]) : []
  end

  def autocomplete
    cities = City.search(params[:query], fields: %i[name state_name state_shortname], match: :word_middle, misspellings: { edit_distance: 2 })
    render(json: cities.results)
  end
end
