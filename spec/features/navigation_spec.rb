require 'rails_helper'

feature 'Navigation', js: true do
  scenario "changes active menu element depending on route" do
    visit '/'
    expect(find('.active').find('a').text).to eq('Home')

    find('.navbar-nav').click_link('TODO')
    expect(find('.active').find('a').text).to eq('TODO')
  end
end
