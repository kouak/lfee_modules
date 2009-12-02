class StaticController < ApplicationController
  
  def homepage
    # User already logged in, redirect to profile page
    redirect_to :myprofile and return unless current_user.nil?
    
    # Login + register forms
    @user_session = UserSession.new
  end
  
end
