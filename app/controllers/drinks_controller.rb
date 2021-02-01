class DrinksController < ApplicationController
    before '/drinks/*' do
        authentication_required
    end

    get "/drinks/new" do
        erb :"/drinks/new.html"
    end

    post '/drinks' do
        @drinks = Drink.build(params)
        @drinks.client = current_client
        redirect "/drinks/#{@drinks.id}/edit"
    end

    get "/drinks/:id/edit" do
        erb :"/drinks/edit.html"
    end

    get '/alldrinks' do
        @drinks = Drink.all

        erb :"/drinks/show.html"
    end




  # GET: /drinks
  get "/drinks" do
    erb :"/drinks/index.html"
  end

  # GET: /drinks/new

  # POST: /drinks
  post "/drinks" do
    redirect "/drinks"
  end

  # GET: /drinks/5
  get "/drinks/:id" do
    erb :"/drinks/show.html"
  end

  # GET: /drinks/5/edit

  # PATCH: /drinks/5
  patch "/drinks/:id" do
    redirect "/drinks/:id"
  end

  # DELETE: /drinks/5/delete
  delete "/drinks/:id/delete" do
    redirect "/drinks"
  end
end
