class CreateUsersCoupons < ActiveRecord::Migration
    create_table :usercoupons do |t|
      t.string :user_id
      t.string :coupon_id
    end 
  end
  