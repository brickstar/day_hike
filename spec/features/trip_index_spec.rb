require 'rails_helper'
=begin
As a visitor,
when I visit the hiking trips index page,
I see a list of all hiking trip names in
the database.
=end

describe 'user visits trips index' do
  before(:each) do
    @trip1 = Trip.create!(name: 'thunderdome', start_date: 'Tue, 04 Aug 2015', end_date: 'Tue, 04 Aug 2015')
    @trip2 = Trip.create!(name: 'rain', start_date: 'Tue, 04 Aug 2015', end_date: 'Tue, 04 Aug 2015')

  end
  it 'should see all names' do
    visit trips_path

    expect(page).to have_content(@trip1.name)
    expect(page).to have_content(@trip2.name)
  end
end
