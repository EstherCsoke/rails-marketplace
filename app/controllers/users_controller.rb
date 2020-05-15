class UsersController < ApplicationController

def home
  if user_signed_in?
    redirect_to profile_path
  end 
end 

def profile
end 
  
  
end 