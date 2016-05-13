require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Post" do
  let(:request_attributes){
    {data: {type: "posts", attributes: {image: "data:image/png;base64,validbase64"}}}
  }

  header "Content-Type", "application/vnd.api+json"
  header "Accept", "application/vnd.api+json"

  post "/api/posts" do
    example "Post a photo" do
      stub_request(:post, "https://api.cloudinary.com/v1_1//auto/upload").
        to_return(:status => 200, :body => {data: "mock_response"}.to_json, :headers => {})

      do_request(request_attributes)

      expect(status).to eq 201

      images = JSON.parse(response_body)
                   .fetch("data")
                   .fetch("attributes")
                   .fetch("image")
      expect(images["image"]["url"]).to be_present
    end
  end
end
