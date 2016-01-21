class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :games

	def update_highscore(number)
		n = number.to_i
		
		self.update(high_score: n) if n > high_score
	end
end
