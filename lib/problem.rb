module Problem
	attr_reader :x, :y

	def new_problem
		@x = rand(1..12)
		@y = rand(1..12)
	end

	def solution(problem_type)
		if problem_type == 'multiplication'
			@x * @y
		else
			@x / @y
		end
	end

	def compare(arg1, arg2)
		arg1 == arg2
	end
end
