# frozen_string_literal: true

require 'rails_helper'

describe 'as a logged in user' do
  it 'can see its repositories on its dashboard', :vcr do
    user = create(:user, token: ENV['GITHUB_ACCESS_TOKEN_2'])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/dashboard'

    expect(current_path).to eq('/dashboard')

    within ('#github_section') do
      expect(page).to have_content('Github')
      expect(page).to have_content('Repositories:')
      expect(page).to have_css('#repo', count: 5)
      expect(page).to have_link('pet_shop_paired', href: 'https://github.com/adumortier/pet_shop_paired')
    end
  end
end
