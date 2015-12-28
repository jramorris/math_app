RSpec.describe GamesController do
	let(:user) { double(id: 12) }

	before(:each) do
		allow(controller).to receive(:current_user).and_return user
	end

	describe ".new" do
		it "creates game with user_id equal to current_user" do
			allow(controller).to receive(:require_user).and_return user
			get :new
			expect(response).to redirect_to '/games/1'
		end
	end
end
