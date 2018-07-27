require 'rails_helper'

describe Trip, type: :model do

  before(:each) do
    @trip = Trip.create!(name: 'thunder', start_date: 'Tue, 04 Aug 2015', end_date: 'Tue, 04 Aug 2015')
    @trail1 = @trip.trails.create!(length: 1, name: 'sketchy', address: 'main st')
    @trail2 = @trip.trails.create!(length: 3, name: 'scary', address: 'state st')
  end

  describe 'instance methods' do
    it '.total_hiking_distance' do
      expect(@trip.total_hiking_distance).to eq(4)
    end
  end
end
