class User < ActiveRecord::Base
	has_many :posts
	has_one  :profile

	def user_name_taken
		User.all.each do |compare|
			if 
		   	
		  
		end
		  end 
		
	end
 
 	def has_posts
		if self.posts.first != nil
			return 1
		else 
		 return 0
		end 
	end	 
end

class Profile < ActiveRecord::Base
	belongs_to :user
end

class Post < ActiveRecord::Base
	belongs_to :user

	def has_posts
		if self.posts.exists?
			return 1
		else 
		 return 0	

		end
		
	end

end