class WelcomeController < ApplicationController
  def home
    if logged_in?
      @myAcceptedTasks = Task.where(runner_id: current_user.id)
      @myPublishedTasks = Task.where(user_id: current_user.id)
    else
      @myAcceptedTasks = 0
      @myPublishedTasks = 0
    end
  end

  def about
  end

  def signup
  end

  def open_tasks
  end

  def my_tasks
  end

  def create_task
  end
end
