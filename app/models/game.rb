class Game < ActiveRecord::Base
	belongs_to :user
	
	include Problem

	def increment_streak
		self.increment!(:streak, 1)
	end
end
