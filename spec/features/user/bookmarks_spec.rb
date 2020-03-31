# As a logged in user
# When I visit '/dashboard'
# Then I should see a list of all bookmarked segments under the Bookmarked Segments section
# And they should be organized by which tutorial they are a part of
# And the videos should be ordered by their position
require 'rails_helper'
# first video of section output name of section

RSpec.describe "as a logged in user", :vcr do
  before :each do
    @prework_tutorial_data = {
      "title"=>"Back End Engineering - Prework",
      "description"=>"Videos for prework.",
      "thumbnail"=>"https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg",
      "playlist_id"=>"PL1Y67f0xPzdN6C-LPuTQ5yzlBoz2joWa5",
      "classroom"=>false,
    }
    @prework_tutorial = Tutorial.create! @prework_tutorial_data

    @video_1 = @prework_tutorial.videos.create!({
      "title"=>"Prework - Environment Setup",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"qMkRHW9zE1c",
      "thumbnail"=>"https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg",
      "position"=>1
    })
    @video_2 = @prework_tutorial.videos.create!({
      "title"=>"Prework - SSH Key Setup",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"XsPVWGKK0qI",
      "thumbnail"=>"https://i.ytimg.com/vi/XsPVWGKK0qI/hqdefault.jpg",
      "position"=>2
    })
    @video_3 = @prework_tutorial.videos.create!({
      "title"=>"Prework - Strings",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"iXLwXvev4X8",
      "thumbnail"=>"https://i.ytimg.com/vi/iXLwXvev4X8/hqdefault.jpg",
      "position"=>3
    })
    @video_4 = @prework_tutorial.videos.create!({
      "title"=>"Prework - Arrays",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"c2UnIQ3LRnM",
      "thumbnail"=>"https://i.ytimg.com/vi/c2UnIQ3LRnM/hqdefault.jpg",
      "position"=>4
    })


    @mod_1_tutorial_data = {
      "title"=>"Back End Engineering - Module 1",
      "description"=>"Videos related to Mod 1.",
      "thumbnail"=>"https://i.ytimg.com/vi/tZDBWXZzLPk/hqdefault.jpg",
      "playlist_id"=>"PL1Y67f0xPzdNsXqiJs1s4NlpI6ZMNdMsb",
      "classroom"=>false,
    }

    @m1_tutorial = Tutorial.create! @mod_1_tutorial_data

    @video_5 = @m1_tutorial.videos.create!({
      "title"=>"Flow Control in Ruby",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"tZDBWXZzLPk",
      "thumbnail"=>"https://i.ytimg.com/vi/tZDBWXZzLPk/hqdefault.jpg",
      "position"=>1
    })
    @video_6 = @m1_tutorial.videos.create!({
      "title"=>"How to use SimpleCov",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"WMgDD2lU5nY",
      "thumbnail"=>"https://i.ytimg.com/vi/WMgDD2lU5nY/hqdefault.jpg",
      "position"=>2
    })

    @video_7 = @mod_3_tutorial_data = {
      "title"=>"Back End Engineering - Module 3",
      "description"=>"Video content for Mod 3.",
      "thumbnail"=>"https://i.ytimg.com/vi/R5FPYQgB6Zc/hqdefault.jpg",
      "playlist_id"=>"PL1Y67f0xPzdOq2FcpWnawJeyJ3ELUdBkJ",
      "classroom"=>false,
      "tag_list"=>["Internet", "BDD", "Ruby"],
    }
    @m3_tutorial = Tutorial.create! @mod_3_tutorial_data

    @video_8 = @m3_tutorial.videos.create!({
      "title"=>"Customizing JSON in your API",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"cv1VQ_9OqvE",
      "thumbnail"=>"https://i.ytimg.com/vi/cv1VQ_9OqvE/hqdefault.jpg",
      "position"=>1
    })
    @video_9 = @m3_tutorial.videos.create!({
      "title"=>"Rails Integration Testing",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"J7ikFUlkP_k",
      "thumbnail"=>"https://i.ytimg.com/vi/J7ikFUlkP_k/hqdefault.jpg",
      "position"=>2
    })
    @video_10 = @m3_tutorial.videos.create!({
      "title"=>"BEE - M3 - Building An Internal API",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"R5FPYQgB6Zc",
      "thumbnail"=>"https://i.ytimg.com/vi/R5FPYQgB6Zc/hqdefault.jpg",
      "position"=>3
    })
    @video_11 = @m3_tutorial.videos.create!({
      "title"=>"Stubbing External API Calls in Rails",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"FUYoJTtfJ20",
      "thumbnail"=>"https://i.ytimg.com/vi/FUYoJTtfJ20/hqdefault.jpg",
      "position"=>4
    })
    @video_12 = @m3_tutorial.videos.create!({
      "title"=>"B3 - Making Fetch Happen",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"lqx4sD0E6eY",
      "thumbnail"=>"https://i.ytimg.com/vi/lqx4sD0E6eY/hqdefault.jpg",
      "position"=>5
    })
    @video_13 = @m3_tutorial.videos.create!({
      "title"=>"BDD - Consuming an API",
      "description"=> Faker::Hipster.paragraph(sentence_count: 2, supplemental: true),
      "video_id"=>"FcgkfZEv_LI",
      "thumbnail"=>"https://i.ytimg.com/vi/FcgkfZEv_LI/hqdefault.jpg",
      "position"=>6
    })
    @user_1 = create(:user, token: ENV['GITHUB_ACCESS_TOKEN_1'])
    @bookmark_1 = UserVideo.create(user: @user_1, video: @video_1)
    @bookmark_2 = UserVideo.create(user: @user_1, video: @video_2)
    @bookmark_3 = UserVideo.create(user: @user_1, video: @video_5)
    @bookmark_4 = UserVideo.create(user: @user_1, video: @video_8)
    @bookmark_5 = UserVideo.create(user: @user_1, video: @video_9)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  end

  it "can see a list of all bookmarks in bookmarked segments section organized by tutorial and ordered position" do
    visit "/dashboard"
    expect(page).to_not have_content("Back End Engineering - Prework")

    visit "/tutorials/#{@prework_tutorial.id}?video_id=#{@video_1.id}"
    click_on "Bookmark"

    visit "/tutorials/#{@prework_tutorial.id}?video_id=#{@video_2.id}"
    click_on "Bookmark"

    visit "/tutorials/#{@m1_tutorial.id}?video_id=#{@video_5.id}"
    click_on "Bookmark"

    visit "/tutorials/#{@m3_tutorial.id}?video_id=#{@video_9.id}"
    click_on "Bookmark"

    visit "/tutorials/#{@m3_tutorial.id}?video_id=#{@video_8.id}"
    click_on "Bookmark"

    visit "/dashboard"

    within '#bookmarks' do
      expect(page.all('li')[0]).to have_content(@video_1.title)
      expect(page.all('li')[1]).to have_content(@video_2.title)
      expect(page.all('li')[2]).to have_content(@video_5.title)
      expect(page.all('li')[3]).to have_content(@video_8.title)
      expect(page.all('li')[4]).to have_content(@video_9.title)
    end
  end
end