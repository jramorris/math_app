RSpec.describe GamesController do
	let(:user) { double(id: 12) }

	before(:each) do
		allow(controller).to receive(:current_user).and_return user
		allow(controller).to receive(:require_user).and_return user
	end

	describe ".new" do
		it "creates game with user_id equal to current_user" do
			get :new

			expect(response).to redirect_to '/games/1'
		end
	end

	describe ".show" do
		let(:game) { Game.new(id: 33) }

		before(:each) do
			allow(Game).to receive(:find).and_return game
		end

		it "shows open games" do
			get :show, id: game.id

			expect(response).to render_template :show 
		end

		it "redirects away from closed games" do
			game.close
			get :show, id: game.id

			expect(response).to redirect_to root_path
		end
	end
end
