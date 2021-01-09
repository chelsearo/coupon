class UsersController < ApplicationController
   
    
      get '/login' do
          erb :'users/login'
      end 
    
      post '/login' do
        user = User.find_by(:username=> params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to "/coupons"
        else
          redirect to '/signup'
        end
      end

      get '/users/coupons' do
        @user = User.find_by_id(session[:user_id])
        erb :"users/showitems"
      end 


    
    end 
  