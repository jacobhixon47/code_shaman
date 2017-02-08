require 'rails_helper'

describe Lesson do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :number }
  context "#next" do
    it 'returns the lesson with the next highest number than the current lesson' do
      current_lesson = Lesson.create({:title => 'Ruby Basics', :content => 'Ruby is so kewl', :number => 1})
      next_lesson = Lesson.create({:title => 'Advanced Ruby', :content => 'Ruby is even cooler now...if I can figure it out', :number => 2})
      expect(current_lesson.next).to eq next_lesson
    end
  end
end
