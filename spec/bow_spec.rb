require 'viking'
 
describe "Bow" do 
	let (:b) {Bow.new}

	describe "bow arrows are readable and start 10" do 
		it 'shows the count of arrows' do 
			expect(b.arrows).to eq(10)
		end
	end



	describe "Bows can be created with as many arrows as chosen" do
		let (:bow_with_3) {Bow.new(3)}
		it 'shows three arrows' do 
			expect(bow_with_3.arrows).to eq(3)
		end
	end


	describe "#use" do 
		it 'reduces arrows by one' do 
			b.use
			expect(b.arrows).to eq(9)
		end 
	end

	describe "#out_of_arrows" do
		let (:empty) {Bow.new(0)}
		it 'when no arrows, bow doesnt shoot' do 
			expect(empty.use).to raise_error(RuntimeError)
		end
	end
end