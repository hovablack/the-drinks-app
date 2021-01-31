class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure do
        enable :sessions
        set :session_secret, "appdrinkstotal-4th"

        set :public_folder, 'public'
        set :views, 'app/views'
    end

    get "/" do
        erb :welcome
    end

    get '/logout' do
        session.clear
        redirect'/'
    end

    helpers do
        def logged_in?
            !!current_client
        end

        def current_client
            @current_client ||= Client.find_by(id: session[:client_id]) if session[:client_id]
        end
    end

end
