class WelcomeController < ApplicationController
  def index
  	#@myTasks = Task.find(:all, :conditions => { :user_id => current_user.id })
  	#@myTasks = Task.find({ :user_id => [current_user.id] })
  	if user_signed_in?
      @myCompletedTasks = Task.where(runner_id: current_user.id, status: 2).order(params[:sort])
  		@myAcceptedTasks = Task.where(runner_id: current_user.id, status: 1).order(params[:sort])
  		@myPublishedTasks = Task.where(user_id: current_user.id).order(params[:sort])
  	else
      @myCompletedTasks = nil
  		@myAcceptedTasks = nil
  		@myPublishedTasks = nil
  	end
  end

  def error404
  end

  def tutorial
  end

end
