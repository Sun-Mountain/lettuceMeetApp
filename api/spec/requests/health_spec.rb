require 'rails_helper'

RSpec.describe "Health Check", type: :request do
  describe "GET /index" do
    it "returns http success" do
      # this will perform a GET request to the /health/index route
      get "/health/index"
      
      # 'response' is a special object which contain HTTP response received after a request is sent
      # response.body is the body of the HTTP response, which here contain a JSON string
      expect(response.body).to eq('{"status":"online"}')
      
      # we can also check the http status of the response
      expect(response.status).to eq(200)
    end
  end

end
