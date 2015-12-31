class Game < ActiveRecord::Base
	include Problem

	belongs_to :user

	def increment_streak
		self.increment!(:streak, 1)
	end

	def open?
		self.open
	end

	def close
		self.update(open: false)
	end
end
