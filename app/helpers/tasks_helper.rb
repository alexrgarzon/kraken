module TasksHelper

	def userAsString(userId)
		userString = 'None'
		if(userId > 0)
			userString = User.find(userId).email
			# userObj = User.where(id: userId)
			# user.Obj do |user|
			# 	userString = user.email
			# end
			# userString = userObj.read_attribute('email')
		end
		return userString
    end


	def statusAsString(taskId)
		statusString = 'Open'
		if(taskId == 1)
			statusString = 'In Progress'
		elsif(taskId == 2)
			statusString = 'Completed'
		end
		return statusString
    end

	def sortable(column, title = nil)
		title ||= column.titleize
		direction = (column == params[:sort]) && (params[:direction] == "asc" ? "desc" : "asc")
		link_to title, :sort => column, :direction => direction
	end


    def eddie
    	return 5
    end
end
