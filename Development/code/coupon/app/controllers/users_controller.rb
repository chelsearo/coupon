class UsersController < ApplicationController
    get  '/signup' do
        erb :'users/signup'
     end 

     post '/users' do
        user = User.new(params)
         if user.username.empty? || user.password.empty?
           @error = "Username and Password cannot be blank"
             erb :'users/signup'
         elsif User.find_by(username: user.username)
               @error = "That Username Already Exists!"
               erb :'users/signup'
        else
           user.save 
           session[:user_id] = user.id
           redirect '/coupons'
        end 
     end 
end 