class Room < ActiveRecord::Base
  validates_presence_of :name

  has_many :tables
  belongs_to :game
end
