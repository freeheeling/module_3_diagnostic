require 'rails_helper'

feature 'user can search for members of each house' do
  scenario 'user selects valid house name', :vcr do

    visit '/'

    select 'Gryffindor', from: :house

    click_on 'Search For Members'

    expect(current_path).to eq(search_path)

    expect(page).to have_content('21 Results')

    expect(page).to have_css('.member', count: 21)

    within(first('.member')) do
      expect(first('.name').text).to_not be_empty
      expect(first('.role').text).to_not be_empty
      expect(first('.house').text).to_not be_empty
      expect(first('.patronus').text).to_not be_empty
    end
  end
end
