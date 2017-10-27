require 'rails_helper'

RSpec.describe "Blockings", type: :request do
  describe "GET /blockings" do
    it "works! (now write some real specs)" do
      get blockings_path
      expect(response).to have_http_status(200)
    end
  end
end
