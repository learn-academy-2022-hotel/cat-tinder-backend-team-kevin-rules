require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'returns all the cats' do
      # create a database entry
      Cat.create(
        name: 'Kevin',
        age: 9,
        enjoys: 'looking out the window',
        image: 'https://images.unsplash.com/photo-1607374035509-704bee7e1aa2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhdCUyMGNhcnRvb258ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60'
      )

      # make a request. http verb with url
      get '/cats'

      # to see the response to the request
      # p response
      cat = JSON.parse(response.body)
      # p "cat:", cat
      expect(response).to have_http_status(200)
      expect(cat.length).to eq(1)

    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Kevin',
          age: 9,
          enjoys: 'looking out the window',
          image: 'https://images.unsplash.com/photo-1607374035509-704bee7e1aa2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhdCUyMGNhcnRvb258ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60'
        }
      }

      # make request for create endpoint
      post '/cats', params: cat_params

      # status code
      expect(response).to have_http_status(200)

      # payload
      cat = Cat.first
      p "cat:", cat
      expect(cat.name).to eq('Kevin')
      expect(cat.enjoys).to eq('looking out the window')
    end
  end
end
