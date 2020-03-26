require "rails_helper"

describe "as a logged in user" do
  it "can see its repositories on its dashboard", :vcr do
    user = create(:user, token: ENV['GITHUB_ACCESS_TOKEN'])
    # allow_any_instance_of(ApplicationController).to receive(:currrent_user).and_return(user)
    visit login_path

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log In'

    expect(current_path).to eq("/dashboard")

    within ("#github_section") do
      expect(repo.count).to eq(5)
      expect(page).to have_link("reponame")
      expect(page).to have_link("reponame")
      expect(page).to have_link("reponame")
      expect(page).to have_link("reponame")
      expect(page).to have_link("reponame")
    end


  end
end
# As a logged in user
# When I visit /dashboard
# Then I should see a section for "Github"
# And under that section I should see a list of
# 5 repositories with the name of each Repo linking to the repo on Github
