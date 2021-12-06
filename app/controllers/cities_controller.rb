class CitiesController < ApplicationController
  
  def index
    
  end

  def autocomplete
    cities = City.search params[:query], fields: [:name, :state_name, :state_shortname], match: :word_middle, misspellings: {edit_distance: 2}
    Rails.logger.info "\n\nerr: #{cities.results}\n\n\n"
    render json: cities.results
  end

end