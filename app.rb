require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'rack-flash'
require './models'


enable :sessions 

use Rack::Flash, :sweep => true


configure(:development) {
 set :database, "sqlite3:///test_app.sqlite3"
}
set :sessions, true
set :environment, :development


def current_user 
    if session[:user_id]
      @current_user = User.find( session[:user_id])
     end
end


get '/'  do   
  erb :home

end

post "/sign_in" do
  @user = User.where(email: params[:username]).first
    if @user && @user.password == params[:password]
        flash[:notice] = "You signed in"

        session[:user_id] = @user.id 

        redirect to("blog")
    else 
        flash[:error] = "there was a problem with your login"

        redirect to("/")
    end    
end        

post '/create_user' do 
    
    if params[:email] && params[:password]

      @user = User.create( email: params[:email], password: params[:password])
      session[:user_id] = @user.id
   
      if @user
        redirect to("/blog")
      else
        redirect to("/new_user")  
      
      end
      
    else
      redirect to("/new_user")   
    end
    
end    

get '/new_user' do
 
  erb :new_user
end 

get '/blog' do 
  erb :blog
end

get "/new_post"  do
  if  session[:user_id] == nil
      flash[:error] = "You must first create a user or login!"
      redirect to ("/")
  else
    erb :new_post
  end
end  

post "/create_post" do 
  if params[:post][:title] && params[:post][:body]

    @post = Post.create(params[:post])

    if @post
      redirect to("/blog")
    else
      redirect to("/new_post")
    end  

    else
      redirect to("/new_post")  
   end 
end   

  get "/new_profile" do
    if  session[:user_id] == nil
      flash[:error] = "You must first create a user or login!"
      redirect to ("/")
    else

      erb :new_profile
   end 
 end 


post "/create_profile" do 
  if current_user.id != nil
   if params[:profile][:location] && params[:profile][:life_story] && params[:profile][:age]

      @profile = Profile.create(params[:profile])

      if @profile
        redirect to("/blog")
      else
        redirect to("/new_profile")
      end  

      else
        redirect to("/new_profile")  
    end 
  else   
    flash[:error] = "You must first create a user!"

    redirect to ("/create_profile")
  end  
end   







