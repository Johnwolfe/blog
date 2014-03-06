class AddFollowers < ActiveRecord::Migration
  def change
  		create_table :followers do |t|
  			t.integer :following
  			t.integer :follower
  		end	
  end
end
