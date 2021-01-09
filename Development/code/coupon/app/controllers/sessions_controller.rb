class SessionsController < ApplicationController

    get '/signup' do
          erb :'users/signup'
      end
    
      post '/signup' do
        if params[:username] == ""  || params[:password] == ""
          redirect to '/signup'
        else
          @user = User.new(:username => params[:username], :password => params[:password])
          @user.save
          session[:user_id] = @user.id
          redirect to '/coupons'
        end
      end

    

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/'
        else
          redirect to '/'
        end 
    end 
end 