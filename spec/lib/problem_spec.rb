RSpec.describe Problem do
	let(:dummy_class) { Class.new { extend Problem } }

	before(:each) do
		dummy_class.new_problem
	end

	describe ".new_problem" do
		it "sets x and y variables" do
			expect(dummy_class.x).to be >= 0
			expect(dummy_class.y).to be >= 0
		end
	end

	describe ".solution" do
		context "(multiplication)" do	
			it "multiplies x and y" do
				expect(dummy_class.solution('multiplication')).to eq dummy_class.x * dummy_class.y
			end
		end

		context "(division)" do
			it "divides (x * y) by y" do
				expect(dummy_class.solution('division')).to eq dummy_class.x
			end
		end
	end
end
