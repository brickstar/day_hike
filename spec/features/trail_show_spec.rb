require 'rails_helper'

describe 'user visits trips show' do
  before(:each) do
    @trail = Trail.create!(length: 1, name: 'sketchy', address: 'main st')
    @trip1 = @trail.trips.create!(name: 'thundertrip', start_date: 'Tue, 04 Aug 2015', end_date: 'Tue, 04 Aug 2015')
    @trail2 = @trip1.trails.create!(length: 1, name: 'rocky', address: 'main st')
    @trail3 = @trip1.trails.create!(length: 2, name: 'freaky', address: 'first st')
    @trip2 = @trail.trips.create!(name: 'raintrip', start_date: 'Tue, 04 Aug 2015', end_date: 'Tue, 04 Aug 2015')
    @trail4 = @trip2.trails.create!(length: 5, name: 'scary', address: 'second st')
    @trail5 = @trip2.trails.create!(length: 6, name: 'easy', address: 'third st')
  end

  it 'should see name, address and total length of every trip that includes trail' do
    visit trail_path(@trail)

    expect(page).to have_content(@trip1.name)
    expect(page).to have_content(@trip2.name)
    expect(page).to have_content(@trail.address)
    expect(page).to have_content(@trail2.address)
    expect(page).to have_content(@trail3.address)
    expect(page).to have_content(@trail4.address)
    expect(page).to have_content(@trail5.address)
    expect(page).to have_content("Total trip length: #{@trip1.total_hiking_distance}")
    expect(page).to have_content("Total trip length: #{@trip2.total_hiking_distance}")
  end

  it 'should see total number of trips that include trail' do
    visit trail_path(@trail)
save_and_open_page
    expect(page).to have_content("Total number of hiking trips that include this trail: #{@trail.trips.length}")
  end
end
