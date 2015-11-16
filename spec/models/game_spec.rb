RSpec.describe Game do
	let(:game) { Game.new(streak: 1) }

	describe ".increment_streak" do
		it "updates streak by 1" do
			game.increment_streak

			expect(game.streak).to eq 2
		end
	end
end
