class GamesController < ApplicationController
	def new
		@game = Game.new
		@game.update(user_id: current_user.id)
		@game.save
		
		redirect_to @game
	end

	def show
		@game = Game.find(params[:id])
		if @game.open != true
			flash[:alert] = "Oops, you've stumbled into a closed game"
			redirect_to root_path
		else
			@game.new_problem
		end
	end

	def check_answer
		@game = Game.find(params[:id])

		if params[:answer] == params[:problem_solution]
			flash[:success] = 'Correct!'
			@game.increment_streak
			redirect_to game_path(@game)
		else
			@game.update(open: false)
			@game.user.update_highscore(@game.streak)
			flash[:alert] = 'Wrong...'
			redirect_to root_path
		end
	end

	private

	def game_params
		params.require(:game).permit(:streak, :user_id)
	end
end
