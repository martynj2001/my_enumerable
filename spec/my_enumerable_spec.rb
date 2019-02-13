require './my_enumerable.rb'

RSpec.describe Enumerable do

    context 'when an array is given' do
        let(:arr){[1,2,2,4,5]}
        describe '#my_select' do
            it 'returns all elements greater than 3' do
                expect(arr.my_select{|a| a > 3}).to eql([4,5])
            end
        end
        describe '#my_all?' do
            it 'returns true if all elements greater than 6' do
                expect(arr.my_all?{|a| a < 6}).to be true
            end
        end
        describe '#my_none?' do
            it 'returns true if no elements are greater than 6' do
                expect(arr.my_none?{|a| a > 6}).to be true
            end
        end
        describe '#my_count' do
            it 'returns number of elements in array' do
                expect(arr.my_count).to eql(5)
            end
            it 'returns the number 2s in the array' do
                expect(arr.my_count(2)).to eql(2)
            end
            it 'returns the number of even numbers in the array' do
                expect(arr.my_count{|a| a%2 == 0}).to eql(3)
            end
        end
        describe '#my_map' do
            it 'returns an array of the elements squares' do
                expect(arr.map{|a| a*a}).to eql([1,4,4,16,25])
            end
        end
    end
end

