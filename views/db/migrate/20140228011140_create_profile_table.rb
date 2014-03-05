class CreateProfileTable < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
  		t.string :location
  		t.text  :life_story
  		t.integer  :age
  		t.integer  :user_id
  	end	
  end
end
