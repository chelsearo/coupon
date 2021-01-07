class CreateCoupons < ActiveRecord::Migration
  def change
      create_table :coupons do |t|
        t.string :store_name
        t.string :code
        t.string :description
      end
  end
end
