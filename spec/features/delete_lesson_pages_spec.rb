require 'rails_helper'

describe "deleting a lesson" do
  it "deletes a lesson" do
    lesson = Lesson.create(:title => 'Ruby Basics', :content => 'Ruby is kewlllllio.', :number => 1)
    visit lesson_path(lesson)
    click_on 'Delete'
    expect(page).to have_content 'successfully deleted'
  end
end
