RSpec.describe GamesController do
	let(:user) { double(id: 12) }
	let(:game) { Game.new(id: 33) }

	before(:each) do
		allow(controller).to receive(:current_user).and_return user
		allow(controller).to receive(:require_user).and_return user
		allow(Game).to receive(:find).and_return game
	end

	describe ".new" do
		it "creates empty game" do
			get :new

			expect(response).to render_template :new
		end
	end

	describe ".create" do

		it "makes" do
			attributes = { game: Game.new }
			post :create, game: attributes

			expect(response).to redirect_to game_path(Game.last)
		end
	end

	describe ".show" do
		it "shows open games" do
			get :show, id: game.id

			expect(response).to render_template :show 
		end

		it "redirects from closed games" do
			game.close
			get :show, id: game.id

			expect(response).to redirect_to root_path
		end
	end

	describe ".check_answer" do
		context "when answer is correct" do
			it "increments game's streak" do
				get :check_answer, id: game.id

				expect(game.streak).to be > 0
			end

			it "redirects to game" do
				get :check_answer, id: game.id

				expect(response).to redirect_to game_path(game)
			end
		end

		context "when answer is incorrect" do
			before(:each) do
				allow(game).to receive(:compare).and_return false
				allow(game).to receive(:user).and_return user
				allow(user).to receive(:update_highscore).and_return game.streak
			end

			it "closes the game" do
				get :check_answer, id: game.id

				expect(game.open).to be false
			end

			it "redirects to root_path" do
				get :check_answer, id: game.id

				expect(response).to redirect_to root_path
			end
		end
	end
end
