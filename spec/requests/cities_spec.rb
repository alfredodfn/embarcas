require 'rails_helper'

RSpec.describe "Cities", type: :request do
  describe "GET /cities" do
    it "with no params" do
      get '/cities'
      expect(response).to render_template(:index)
      expect(response.body).to include('<th scope="col">#</th>')
      expect(response.body).not_to include('<th scope="col">Curitiba</th>')
    end
  end
end
