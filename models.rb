class User < ActiveRecord::Base
	has_many :posts
	has_one  :profile
	has_many :followers

end

class Profile < ActiveRecord::Base
	belongs_to :user
end

class Post < ActiveRecord::Base
	belongs_to :user
end

class Follower < ActiveRecord::Base
	belongs_to :user
end	
