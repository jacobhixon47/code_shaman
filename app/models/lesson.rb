class Lesson < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true
end
