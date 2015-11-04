class Game < ActiveRecord::Base
	include Problem

	def increment_streak
		self.increment!(:streak, 1)
	end
end
