module TasksHelper

	def statusAsString(taskNum)
		statusString = 'Open'
		if(taskNum == 1)
			statusString = 'In Progress'
		elsif(taskNum == 2)
			statusString = 'Completed'
		end
		puts statusString
    end

    def eddie
    	puts 5
    end
end
