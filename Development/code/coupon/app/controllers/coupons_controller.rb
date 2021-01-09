class CouponsController < ApplicationController
    
    get '/coupons' do
        if logged_in?
          @coupon = Coupon.all
          erb :'coupons/index'
        else
          redirect to '/login'
        end
      end
    
      get '/coupons/new' do
        if logged_in?
          erb :'coupons/new'
        else
          redirect to 'users/login'
        end
      end
    
      post '/coupons/new' do
        if logged_in?
          @coupon =  Coupon.create(params)
          @user = User.find_by_id(session[:user_id])
          @coupon.users << @user
            redirect to "/users/coupons"
        
        else
          redirect to '/login'
        end
      end

      post '/coupons' do 
        @coupon = Coupon.find_by_id(params[:coupon_id])
        @user = User.find_by_id(session[:user_id])
         @coupon.users << @user

        

        redirect to 'users/coupons'


      end   
    
      get '/coupons/:id' do
        if logged_in?
          @coupon = Coupon.find_by_id(params[:id])
          erb :'coupons/show'
        else
          redirect to '/login'
        end
      end
    
      get '/coupons/:id/edit' do
        if logged_in?
          @coupons = Coupon.find_by_id(params[:id])
          if @coupon && @coupon.users.include?(current_user)
            erb :'coupon/edit'
          else
            redirect to '/coupons'
          end
        else
          redirect to '/login'
        end
      end
    
      patch '/coupons/:id' do
        if logged_in?
          if params[:description] == ""
            redirect to "/coupons/#{params[:id]}/edit"
          else
            @coupon = Coupon.find_by_id(params[:id])
              if @coupon.update(description: params[:description], store_name: params[:store_name], code: params[:code] )
                
                redirect to "/coupons/#{@coupon.id}"
              else
                redirect to "/coupons/#{@coupon.id}/edit"
              end
          end
        else
          redirect to '/login'
        end
      end
    
      delete '/coupons/:id/delete' do
        if logged_in?
          @coupon = Coupon.find_by_id(params[:id])
          if @coupon && @coupon.users.include?(current_user)
            @coupon.destroy
          redirect to '/coupons'
          end 
        else
          redirect to '/login'
        end
      end
    end