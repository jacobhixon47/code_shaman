require 'rails_helper'

describe "adding a new lesson" do
  it "adds a new lesson" do
    visit lessons_path
    click_link 'New Lesson'
    fill_in 'Title', :with => 'Ruby Basics'
    fill_in 'Content', :with => 'Ruby is kewlllllio.'
    fill_in 'Number', :with => 2
    click_on 'Create Lesson'
    expect(page).to have_content 'Ruby Basics'
  end

  it "gives error when no title, content, or number is entered" do
    visit new_lesson_path
    click_on 'Create Lesson'
    expect(page).to have_content 'errors'
  end
end
