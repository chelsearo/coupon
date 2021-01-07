

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :sessions_seceret,'seceret'
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :home
    
  end

  def logged_in?
      !!User.find_by(id: session[:user_id])
  end 
# index
get "/coupons" do
  @coupon = Coupon.all
  erb :index
end

# new
get "/coupons/new" do
  @coupon = Coupon.new
  erb :new
end

# create
post "/coupon" do
  @coupon = Coupon.create(params)
  redirect to "/coupon/#{ @coupon.id }"
end

# show
get "/coupons/:id" do
  @coupon = Coupon.find(params[:id])
  erb :show
end

# edit
get "/coupons/:id/" do
  @coupon = Coupon.find(params[:id])
  erb :edit
end

# update
patch "/coupons/:id" do
  @coupon = Coupon.find(params[:id])
  @coupon.update(params[:coupon])
  redirect to "/coupon/#{ @coupon.id }"
end

#destroy
delete "/coupons/:id" do
  Coupon.destroy(params[:id])
  redirect to "/coupons"
end
end 