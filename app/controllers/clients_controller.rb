class ClientsController < ApplicationController


    get "/clients" do
        binding.pry
        erb :"/clients/index.html"
    end

    get "/register" do
        erb :"/clients/new.html"
    end

    post "/clients" do
        if params[:username] && params[:email] && params[:password] != ""
            @clients = Client.create(params)
            session[:client_id] = @clients.id
        else
            erb "/"
        end
    end

    get '/login' do
        erb :"/clients/login.html"
    end

    post '/login' do
        @clients = Client.find_by(username: params[:username])
        if @clients && @clients.authenticate(params[:password])
            # binding.pry
            session[:client_id] = @clients.id
            redirect "/clients"
        else
            redirect "/"
        end
    end


  # GET: /clients/new
#   get "/clients/new" do
#     erb :"/clients/new.html"
#   end

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
