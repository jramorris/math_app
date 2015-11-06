class GamesController < ApplicationController
	def new
		@game = Game.new
		@game.update(user_id: current_user.id)
		@game.save
		
		redirect_to @game
	end

	def show
		@game = Game.find(params[:id])
		@game.new_problem
	end

	def check_answer
		@game = Game.find(params[:id])

		if params[:answer] == params[:problem_solution]
			flash[:success] = 'Correct!'
			@game.increment_streak
			redirect_to game_path(@game)
		else
			flash[:alert] = 'Wrong...'
			redirect_to root_path
		end
	end

	private

	def game_params
		params.require(:game).permit(:streak, :user_id)
	end
end
