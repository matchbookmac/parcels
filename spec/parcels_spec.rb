require('rspec')
require('parcels')

describe('Parcel') do

  describe('parcel?') do
    it('will return true if it is possible to make a parcel from the dimensions provided.') do
      parcel = Parcel.new(2, 2, 3)
      expect(parcel.parcel?()).to(eq(true))
    end
    it('will return false if it is not possible to make a parcel from the dimensions provided.') do
      parcel = Parcel.new(0, 2, 3)
      expect(parcel.parcel?()).to(eq(false))
    end

  end
  describe('#volume') do
    it('will return the volume') do
      parcel = Parcel.new(2, 2, 3)
      expect(parcel.volume()).to(eq(12))
    end
  end
  describe('#cost_to_ship') do
    it('will return the cost of shipping for a parcel based on distance, weight, and speed') do
      parcel = Parcel.new(3, 3, 3)
      expect(parcel.cost_to_ship(4.00, 3.00, 'fast')).to(eq(6.00))
    end
  end
end
