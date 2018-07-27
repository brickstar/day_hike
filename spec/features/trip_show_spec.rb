require 'rails_helper'

describe 'user visits trips show' do
  before(:each) do
    @trip = Trip.create!(name: 'thunder', start_date: 'Tue, 04 Aug 2015', end_date: 'Tue, 04 Aug 2015')
    @trail1 = @trip.trails.create!(length: 1, name: 'sketchy', address: 'main st')
    @trail2 = @trip.trails.create!(length: 3, name: 'scary', address: 'state st')
  end
  it 'should see all names lengths and addresses of trails' do
    visit trip_path(@trip)

    expect(page).to have_content(@trail1.name)
    expect(page).to have_content(@trail1.address)
    expect(page).to have_content(@trail1.length)
    expect(page).to have_content(@trail2.name)
    expect(page).to have_content(@trail2.address)
    expect(page).to have_content(@trail2.length)
  end

  it 'should see total hiking distance of trails' do
    visit trip_path(@trip)

    expect(page).to have_content("Total hiking distance: #{@trip.total_hiking_distance}")

  end

end
