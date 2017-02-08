require 'rails_helper'

describe "updating a lesson" do
  it "allows a user to edit a lesson" do
    lesson = Lesson.create(:title => 'Ruby Basics', :content => 'Ruby is kewlllllio.', :number => 1)
    visit lesson_path(lesson)
    click_on "Edit"
    fill_in 'Title', :with => 'Ruby and Rails'
    click_on 'Update Lesson'
    expect(page).to have_content 'Rails'
  end

  it "gives error when no title, content, or number is entered" do
    lesson = Lesson.create(:title => 'Ruby Basics', :content => 'Ruby is kewlllllio.', :number => 1)
    visit lesson_path(lesson)
    click_on "Edit"
    fill_in 'Title', :with => ''
    click_on 'Update Lesson'
    expect(page).to have_content 'errors'
  end
end
