module UsersHelper
	def average_game(user)
		a = user.games.map { |game| game.streak }
		a.inject{ |sum, n| sum + n } / a.size
	end
end
