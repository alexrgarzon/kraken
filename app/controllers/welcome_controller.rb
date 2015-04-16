class WelcomeController < ApplicationController
  def index
  	#@myTasks = Task.find(:all, :conditions => { :user_id => current_user.id })
  	#@myTasks = Task.find({ :user_id => [current_user.id] })
  	if user_signed_in?
  		@myAcceptedTasks = Task.where(runner_id: current_user.id)
  		@myPublishedTasks = Task.where(user_id: current_user.id)
  	else
  		@myAcceptedTasks = nil
  		@myPublishedTasks = nil
  	end
  end
end
