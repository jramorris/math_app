RSpec.describe User do
	describe "user" do
		let(:user) { User.new(high_score: 10) }

		describe ".update_highscore" do
			context "when argument > user's high score" do
				it "updates the high score" do
					user.update_highscore(20)

					expect(user.high_score).to eq 20
				end
			end

			context "when argument < user's high score" do
				it "user's highscore is constant" do
					user.update_highscore(5)

					expect(user.high_score).to eq 10
				end
			end
		end
	end
end
