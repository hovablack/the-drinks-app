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

end
