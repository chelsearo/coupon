class User < ActiveRecord::Base
   has_secure_password
  # validates :username, :email, :password, presence: true
   #validates_uniqueness_of :username, :email
   has_many :user_coupons
   has_many :coupons, through: :user_coupons
end 