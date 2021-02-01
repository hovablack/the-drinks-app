class ClientsController < ApplicationController

    get "/register" do
        erb :"/clients/new.html"
    end
    
    post "/clients" do
        if params[:username] && params[:email] && params[:password] != ""
            @clients = Client.create(params)
            session[:client_id] = @clients.id
            redirect "/clients/#{@clients.id}"
        else
            flash[:notice] = "You must register"
            redirect "/"
        end
    end
    
    get '/login' do
        erb :"/clients/login.html"
    end
    
    post '/login' do
        @clients = Client.find_by(username: params[:username])
        if @clients && @clients.authenticate(params[:password])
            session[:client_id] = @clients.id
            redirect "/clients/#{@clients.id}"
        else
            redirect "/"
        end
    end
    
    get "/clients/:id" do
        @clients = Client.find_by(id: params[:id])
        flash[:notice] = "Log in successful."
        erb :"/clients/index.html"
    end

    get "/clients/:id/account" do
        # @clients = Client.find_by(id: params[:id])
        erb :"/clients/show.html"
    end

  # POST: /clients

  # GET: /clients/5

  # GET: /clients/5/edit
#   get "/clients/:id/edit" do
#     erb :"/clients/edit.html"
#   end

  # PATCH: /clients/5
#   patch "/clients/:id" do
#     redirect "/clients/:id"
#   end

  # DELETE: /clients/5/delete
#   delete "/clients/:id/delete" do
#     redirect "/clients"
#   end
end
