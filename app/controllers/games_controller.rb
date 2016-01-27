class GamesController < ApplicationController
	before_filter :require_user

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		if @game.save
			@game.update(user_id: current_user.id)
			redirect_to @game
		else
			flash[:alert] = "something went wrong! try making another game..."
			redirect_to :new
		end
	end

	def show
		@game = Game.find(params[:id])
		if @game.open?
			@game.new_problem
		else
			flash[:alert] = "Oops, you've stumbled into a closed game"
			redirect_to root_path
		end
	end

	def check_answer
		@game = Game.find(params[:id])

		if @game.compare(params[:answer], params[:problem_solution])
			flash[:success] = 'Correct!'
			@game.increment_streak
			redirect_to game_path(@game)
		else
			@game.close
			@game.user.update_highscore(@game.streak)
			flash[:alert] = 'Wrong...'
			redirect_to root_path
		end
	end

	private

	def game_params
		params.require(:game).permit(:streak, :user_id, :game_type)
	end
end
