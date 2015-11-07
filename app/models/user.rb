class User < ActiveRecord::Base
	has_secure_password

	has_many :games

	def update_highscore(number)
		n = number.to_i
		self.update(high_score: n) if n > high_score
	end
end
