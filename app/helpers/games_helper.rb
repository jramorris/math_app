module GamesHelper
	def print_problem(problem_type)
		if problem_type == 'multiplication'
			p "#{@game.x} x #{@game.y}"
		else
			p"#{@game.x * @game.y} / #{@game.y}"
		end 
	end
end
