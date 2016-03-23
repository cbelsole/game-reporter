class Table < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :room
  has_many :users
end
