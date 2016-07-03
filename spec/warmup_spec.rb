require "warmup.rb"

describe "Warmup" do 
	let (:warm) { Warmup.new }

	describe "#gets_shout" do 
		it 'returns uppercase' do 
			allow(warm).to receive(:gets).and_return("hihi")
			expect(warm.gets_shout).to eq("HIHI")
		end
	end


	describe "#triple_size" do
		it 'returns triple the size of a double' do 
			arr = double("Array", :size => 3)
			expect(warm.triple_size(arr)).to eq(9)
		end
	end
end