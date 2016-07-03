require 'viking'

describe "Viking" do 

	let (:cal) {Viking.new("Calvin",69)}
	let (:val) {Viking.new("Valvin",100)}
	let (:empty_bow) {Bow.new(0)}
	let (:almost_dead) {Viking.new("Villager", 1)}

	describe "vik boi" do 
		it 'displays the name of the viking just created' do 
			expect(cal.name).to eq("Calvin")
		end
	end


	describe "vik boi health" do 
		it 'displays the health of the viking just created' do 
			expect(cal.health).to eq(69)
		end
	end


	describe "Health of the created" do 
		it 'The player cannot change the health of the viking' do 
			expect {cal.health = 200}.to raise_error(NoMethodError)
		end
	end

	describe "What weapon does the viking start out with?" do 
		it 'should start out with nothing' do 
			expect(cal.weapon).to eq(nil)
		end
	end

	describe "Cal has been attaked" do 
		it 'the health of cal should be reduced' do 
			cal.receive_attack(5)
			expect(cal.health).to eq(64)
		end
	end

	describe "Cal will attack Val" do 
		it 'should reduce Vals hp' do 
			cal.attack(val)
			expect(val.health).to eq(97.5)
		end
	end

	describe "What happens when you attack with no weapon" do 
		it 'should attack the other viking with fist' do 
			cal.attack(val)
			allow(val).to receive(:damage_with_fists)
		end
	end

	describe "What happens when the bow has no arrows" do 
		it 'viking should use fist instead' do 
			cal.pick_up_weapon(empty_bow)
			cal.attack(val)
			allow(val).to receive(:damage_with_fists)
		end
	end

	describe "What happens when you try and kill a viking" do 
		it 'should give an error' do 
			expect {cal.attack(almost_dead)}.to raise_error(RuntimeError)
		end
	end
end
