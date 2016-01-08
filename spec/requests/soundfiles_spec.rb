require 'rails_helper'

RSpec.describe "Soundfiles", type: :request do
  describe "GET /soundfiles" do
    it "works! (now write some real specs)" do
      get soundfiles_path
      expect(response).to have_http_status(200)
    end
  end
end
