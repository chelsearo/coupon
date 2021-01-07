class SessionsController < ApplicationController

    get '/users/login' do
        erb :'users/login'
    end

    post '/login' do
        if 
          params["username"].empty? || params["password"].empty?
            @error = "Username and Password cannot be blank"
              erb :'users/signup'
        else 
            if 
                logged_in?
                redirect '/coupons'
            else 
                @error = "Account Not Found"
                erb :'users/login'
            end 
        end 
    end 

        get '/logout' do
            session.clear
            redirect '/'
        end 
end