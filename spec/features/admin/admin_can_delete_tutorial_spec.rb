# frozen_string_literal: true

require 'rails_helper'

feature 'An admin can delete a tutorial' do
  scenario 'and it should no longer exist' do
    admin = create(:admin)
    create_list(:tutorial, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'

    expect(page).to have_css('.admin-tutorial-card', count: 2)

    within(first('.admin-tutorial-card')) do
      click_link 'Delete'
    end

    expect(page).to have_css('.admin-tutorial-card', count: 1)
  end

  it 'deletes videos when tutorial is deleted' do
    admin = create(:admin)
    tutorial = create(:tutorial)
    # rubocop:todo Naming/VariableNumber
    video_1 = create(:video, tutorial_id: tutorial.id)
    # rubocop:enable Naming/VariableNumber
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'
    expect(Video.all.count).to eq(1)

    expect(page).to have_css('.admin-tutorial-card', count: 1)

    within(first('.admin-tutorial-card')) do
      click_link 'Delete'
    end

    expect(Video.all.count).to eq(0)
  end
end
