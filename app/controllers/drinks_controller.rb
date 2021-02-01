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

    get "/drinks/:id" do
        @drinks = current_client.drinks.find(params[:id])
        erb :"/drinks/show.html"
    end

    post '/drinks' do
        if params[:name] && params[:quantity] != ""
            @drinks = Drink.create(name: params[:name], quantity: params[:quantity], category: params[:category], client_id: current_client.id)
            redirect "/drinks/#{@drinks.id}"
        else
            redirect '/drinks/new'
        end
    end


    get "/drinks/:id/edit" do
        drink_search
        erb :"/drinks/edit.html"
    end

    patch "/drinks/:id" do
        drink_search
        "Hello World"
    end



    private

    def drink_search
        @drinks = Drink.find(params[:id])
    end






    # delete "/drinks/:id/delete" do
    #     redirect "/drinks"
    # end
#   # GET: /drinks/5
#   get "/drinks/:id" do
#     erb :"/drinks/show.html"
#   end
# 
#   # GET: /drinks/5/edit
# 
#   # PATCH: /drinks/5
# 
#   # DELETE: /drinks/5/delete
end
