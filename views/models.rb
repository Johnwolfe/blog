class User < ActiveRecord::Base
	has_many :posts
	has_one  :profile

	def user_name_taken
		User.all.each do |compare|
			if 
		   	
		  
		end
		  end 
		
	end

end

class Profile < ActiveRecord::Base
	belongs_to :user
end

class Post < ActiveRecord::Base
	belongs_to :user

	def has_posts
		if User.posts.exists?

		end
		
	end

end