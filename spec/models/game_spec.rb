RSpec.describe Game do
	let(:game) { Game.new(streak: 1) }

	describe ".increment_streak" do
		it "updates streak by 1" do
			game.increment_streak

			expect(game.streak).to eq 2
		end
	end

	describe ".open?" do
		it "returns true if game is open" do
			expect(game.open?).to eq true
		end

		it "returns false if game is not open" do
			game.close

			expect(game.open?).to eq false
		end
	end

	describe ".close" do
		it "updates game.open to return false" do
			game.close

			expect(game.open?).to eq false
		end
	end
end
