class CreateUsersCoupons < ActiveRecord::Migration
    create_table :user_coupons do |t|
      t.integer :user_id
      t.integer :coupon_id
    end 
  end
  