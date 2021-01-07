class CouponsController < ApplicationController

    get '/coupons' do
        user = User.find(session[:user_id])
        if user
            @coupons = Coupon.all.reverse
            erb :'/coupons/index'
        else 
            @error = "Invaild. Please Try Again."
            redirect '/login'
        end 
    end 

    get '/coupons/index' do 
        if user.find_by(id: session[:user_id])
           @coupon = Coupon.find(params[:id])
           erb :'coupons/index'
        else 
           redirect '/login'
        end  
    end 

end 