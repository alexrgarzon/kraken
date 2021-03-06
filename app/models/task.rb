class Task < ActiveRecord::Base

	
	geocoded_by :address
	after_validation :geocode

	belongs_to :category

	def self.searchOpen(search)
		Rails.logger.debug("inside self.search")
		Rails.logger.debug("My object: #{search}")
		#Rails.logger.debug("My object: #{@q}")
		#if search.present?
		if search
			#find(:all, :conditions => ['title LIKE ?', "%#{q}%"])
			#where('title LIKE ?', "%#{search}%")
			#Task.where('title LIKE ?', "%#{search}%")
			#zero = "0"
			Task.where('(title LIKE :search OR description LIKE :search OR payment_description LIKE :search) AND status::varchar LIKE \'%0%\'::varchar', search: "%#{search}%")
		else
			#where(true)
			#Task.all
			Task.where('(title LIKE :search OR description LIKE :search OR payment_description LIKE :search) AND status::varchar LIKE \'%0%\'::varchar', search: "%#{search}%")
			#self.all
			#find(:all)
		end
	end

	def self.getInProgress()
		Task.where('status::varchar LIKE \'%1%\'::varchar')
	end

	def self.getCompleted()
		Task.where('status::varchar LIKE \'%2%\'::varchar')
	end

	def self.getCatInProgress(cat)
		Task.where('(status::varchar LIKE \'%1%\'::varchar) AND (category_id::varchar LIKE (:cat)::varchar)', cat: "%#{cat}%")
	end

	def self.getCatCompleted(cat)
		Rails.logger.debug("the right side: #{cat}")
		Task.where('(status::varchar LIKE \'%2%\'::varchar) AND (category_id::varchar LIKE (:cat)::varchar)', cat: "%#{cat}%")
	end

	def self.searchCatOpen(search, cat)
		Rails.logger.debug("inside self.search")
		Rails.logger.debug("My object: #{search}")
		#Rails.logger.debug("My object: #{@q}")
		#if search.present?
		if search
			#find(:all, :conditions => ['title LIKE ?', "%#{q}%"])
			#where('title LIKE ?', "%#{search}%")
			#Task.where('title LIKE ?', "%#{search}%")
			#zero = "0"
			Task.where('(title LIKE :search OR description LIKE :search OR payment_description LIKE :search) AND (status::varchar LIKE \'%0%\'::varchar) AND (category_id::varchar LIKE (:cat)::varchar)', cat: "%#{cat}%", search: "%#{search}%")
		else
			#where(true)
			#Task.all
			Task.where('(title LIKE :search OR description LIKE :search OR payment_description LIKE :search) AND (status::varchar LIKE \'%0%\'::varchar) AND (category_id::varchar LIKE (:cat)::varchar)', cat: "%#{cat}%", search: "%#{search}%")
			#self.all
			#find(:all)
		end
	end



end

