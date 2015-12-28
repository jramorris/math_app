module Problem
	attr_reader :x, :y

	def new_problem
		@x = rand(1..12)
		@y = rand(1..12)
	end

	def solution
		@x * @y
	end

	def compare(arg1, arg2)
		arg1 == arg2
	end
end
