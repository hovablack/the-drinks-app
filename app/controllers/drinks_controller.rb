class DrinksController < ApplicationController
    before '/drinks/*' do
        authentication_required
    end
    
    get "/drinks" do
        @drinks = current_client.drinks
        erb :"/drinks/index.html"
    end

    get "/drinks/new" do
        erb :"/drinks/new.html"
    end

    post '/drinks' do
        if params[:name] && params[:quantity] != ""
            @drinks = Drink.create(name: params[:name], quantity: params[:quantity], category: params[:category], client_id: current_client.id)
            redirect '/drinks'
        else
            redirect '/drinks/new'
        end
    end

    get "/drinks/:id/edit" do
        erb :"/drinks/edit.html"
    end

    get '/alldrinks' do
        @drinks = Drink.all

        erb :"/drinks/show.html"
    end




  # GET: /drinks

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
