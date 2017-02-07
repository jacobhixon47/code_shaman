require 'rails_helper'

describe Lesson do
  it { should validate_presence_of :title } 
  it { should validate_presence_of :content }
  it { should validate_presence_of :number }
end
